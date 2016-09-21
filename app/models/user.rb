class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :initials
  after_initialize :set_initials
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :tasks, as: :taskable
  has_many :posts
  has_many :comments

  validates :name, presence: true, format:{ with: /\A[a-z ]+\z/i }

  def set_initials
		self.initials = self.name.scan(/(\b[a-z])[a-z]*?/i).join.upcase
  end
end
