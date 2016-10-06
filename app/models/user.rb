class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :initials
  after_find :set_initials
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :tasks, as: :taskable
  has_many :posts
  has_many :comments
  has_many :notifications, foreign_key: :recipient_id
  acts_as_follower

  validates :name, presence: true

  def set_initials
		self.initials = self.name.scan(/(\b[a-z])[a-z]*?/i).join.upcase
  end
  def tasks
  	Task.where('user_id = ? AND due_date >= ?',id,Time.now)
  	.where.not(status:"complete").order(:due_date)
  end
end
