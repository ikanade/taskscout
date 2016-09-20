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
	validates :title,  presence: true, length: {is: 200}
	validates :description, allow_blank: true
	validates :priority, presence: true 
	def add_creator_to_members
		self.members << self.creator 
	end
end
