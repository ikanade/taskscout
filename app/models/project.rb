class Project < ActiveRecord::Base
	has_many :tasks, as: :taskable
	belongs_to :user
	alias_attribute :creator, :user
	has_many :project_users
	has_many :users, through: :project_users
	alias_attribute :members, :users
	has_many :posts
  acts_as_followable
  after_find :set_progress
  before_save :add_creator_to_members, if: :user_id_changed?
	validates :title,  presence: true, length: {maximum: 200}	
	validates :progress, presence: true, numericality: { only_integer: true },
										 length: {maximum: 3}
	validates_datetime :deadline, after: :started_at, if: :deadline_changed?
	validates :user_id, presence: true
	
	def add_creator_to_members
		self.members << self.user
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
