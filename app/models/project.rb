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
	validates :priority, presence: true,inclusion: {in: %w(low normal high ASAP)}
	validates :status, presence: true
	validates_format_of :status,:with => ^[A-Za-z]+$ 
	validates :progress, presence: true, numericality: { only_integer: true }, length: {in: 1..3}
	validate :is_valid_date?
	validates_datetime :due_date, :after => :started_at 
	private
	  def is_valid_date?
	    if((due_date.is_a?(Date) rescue ArgumentError) == ArgumentError)
	      errors.add(:due_date, 'Sorry, Invalid Date.')
	    end
	  end

	def add_creator_to_members
		self.members << self.creator 
	end
end
