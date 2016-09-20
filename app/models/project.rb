class Project < ActiveRecord::Base
	belongs_to :user
	alias_attribute :creator, :user
	has_many :project_users
	has_many :users , through: :project_users
	alias_attribute :members, :users
	before_save :add_creator_to_members, if: :user_id_changed?

	def add_creator_to_members
		self.members << self.creator 
	end
end
