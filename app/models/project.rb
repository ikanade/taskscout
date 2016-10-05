class Project < ActiveRecord::Base
	has_many :tasks, as: :taskable
	belongs_to :creator, class_name:'User', foreign_key: :user_id
	has_many :project_users
	has_many :members, source: :user, through: :project_users
	has_many :posts
  	acts_as_followable
  	after_find :set_progress
  	before_save :add_creator_to_members, if: :user_id_changed?
	
	validates :title,  presence: true, length: {maximum: 200}	
	validates :progress, presence: true, numericality: { only_integer: true },
										 inclusion: {in: 0..100}
	validates_datetime :deadline, after: :started_at, if: :deadline_changed?
	validates_datetime :deadline
	validates_datetime :started_at
	validates :creator, presence: true
	
	def add_creator_to_members
		self.members << self.creator
	end
	def set_progress 
    addition = 0
    self.tasks.each do |task|
      unless task.progress == 0
					addition += task.progress 
					self.progress = addition / self.tasks.count  
			end
    end
	end
end
