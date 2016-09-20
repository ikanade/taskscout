class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, as: :commentable

  validates_associated :comments
  validates :title,  presence: true, length: {is: 200}
  validates :body, allow_blank: true
end
