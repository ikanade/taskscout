class Project < ActiveRecord::Base
	has_many :tasks, as: :taskable
	belongs_to :user
	alias_attribute :creator, :user
	has_many :project_users
	has_many :users, through: :project_users
	alias_attribute :members, :users
	before_save :add_creator_to_members, if: :user_id_changed?
	has_many :posts
	
	validates_associated :posts
	validates_associated :tasks
	validates_associated :project_users
	validates :title,  presence: true, length: {maximum: 200}
	
	validates :status, presence: true, format:{ with: /\A[a-z]+\z/i }
	validates :progress, presence: true, numericality: { only_integer: true },
											 length: {maximum: 3}
	#validate :is_valid_date?
	validates_datetime :deadline, after: :started_at 
	private
	  #def is_valid_date?
	   # if((due_date.is_a?(Date) rescue ArgumentError) == ArgumentError)
	   #   errors.add(:due_date, 'Sorry, Invalid Date.')
	    #end
	  #end
		def add_creator_to_members
			self.members << self.creator 
		end
end
