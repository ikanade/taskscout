class Project < ActiveRecord::Base
	has_many :tasks, as: :taskable
	belongs_to :user
	alias_attribute :creator, :user
	has_many :project_users
	has_many :users, through: :project_users
	alias_attribute :members, :users
	
	has_many :posts
  	acts_as_followable


	validates :title,  presence: true, length: {maximum: 200}	
	validates :progress, presence: true, numericality: { only_integer: true },
										 length: {maximum: 3}
	validates_datetime :deadline, after: :started_at, if: :deadline_changed?
	validates :user_id, presence: true
	
	
end
