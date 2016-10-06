class Task < ActiveRecord::Base
	belongs_to :taskable, polymorphic: true
	has_many :tasks, as: :taskable
	belongs_to :user
	has_many :comments, as: :commentable
	has_many :labels, as: :labelable
	acts_as_followable
	after_save :set_user_as_follower , if: :user_id_changed?
	after_create :set_project_creator_as_follower
	after_find :set_progress
	after_save :set_progess_on_status_change, if: :status_changed?
	validates :taskable_type , presence: true, inclusion: { within: %w(Project Task) }
	validates_datetime :due_date, after: :started_at 
	validates :title,  presence: true, length: {maximum: 200}
	validates :priority, presence: true,inclusion: {in: %w(low normal high ASAP)}
	validates :status, presence: true, inclusion: { in: %w(complete active inactive none) }
	validates :progress, presence: true ,
	numericality: { only_integer: true }, length: {maximum: 3}


	def parent_project
		if self.taskable.class.name == 'Project'
			 self.taskable 
		else
			self.taskable.get_parent_project
		end
	end
	private
	def set_user_as_follower
		self.user.follow(self)
	end
	def set_project_creator_as_follower
		if self.taskable_type == 'Project'
			project = Project.find(self.taskable_id)
			project.creator.follow(self)
		end
	end
	def set_progress
		if self.tasks
			subtasks = self.tasks
			addition = 0
			subtasks.each do |subtask|
				unless subtask.progress == 0
					addition += subtask.progress 
					self.progress = addition / subtasks.count  
				end
			end
		end 
	end
	def set_progess_on_status_change

	end
end
