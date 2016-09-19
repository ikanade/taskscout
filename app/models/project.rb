class Project < ActiveRecord::Base
	belongs_to :user
	alias_attribute :creator, :user
	has_many :project_users
	has_many :users , through: :project_users
end
