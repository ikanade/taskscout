class Project < ActiveRecord::Base
	has_many :tasks, as: :taskable
	belongs_to :user
	alias_attribute :creator, :user
	has_many :project_users
	has_many :users, through: :project_users
	alias_attribute :members, :users
	before_save :add_creator_to_members, if: :user_id_changed?
	has_many :posts
  acts_as_followable


	validates :title,  presence: true, length: {maximum: 200}
	validates :status, presence: true, format:{ with: /\A[a-z]+\z/i }, on: :update
	validates :progress, presence: true, numericality: { only_integer: true },
										 length: {maximum: 3}
	validates_datetime :deadline, after: :started_at, if: :deadline_changed?
	
	private	
		def add_creator_to_members
			self.members << self.creator 
		end
end
