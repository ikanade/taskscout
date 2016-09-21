class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :tasks, as: :taskable
  has_many :posts
  has_many :comments

  validates_associated :projects
  validates_associated :project_users
  validates_associated :posts
  validates_associated :comments
  validates :name, presence: true, format:{ with: /\A[a-z ]+\z/i }

end
