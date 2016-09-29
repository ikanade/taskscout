class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :labels, as: :labelable
  acts_as_followable
  after_save :set_user_as_follower , if: :user_id_changed?
  after_create :set_project_creator_as_follower
  
  validates :taskable_type , presence: true, inclusion: { within: %w(Project Task) }
  validates_datetime :due_date, after: :started_at 
  validates :title,  presence: true, length: {maximum: 200}
  validates :priority, presence: true,inclusion: {in: %w(low normal high ASAP)}
  validates :status, presence: true,inclusion: { in: %w(finished active inactive none) }
  validates :progress, presence: true ,
                 numericality: { only_integer: true }, length: {maximum: 3}

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
=begin 	
 def notify_followers
  		followers = self.followers
  		followers.each do |user| 
  			Pusher['private-'+user.id].trigger('new_notification',
				 { 
				 	from: 'Task:', 
				 	subject: "Task: has been updated",
				 	body: self.title })

  		end
  	end
=end

end
