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
  validates_associated :posts
  validates_associated :comments
  validates_format_of :name, :with => /\A[A-Za-z ]+\Z/ , presence: true

end
