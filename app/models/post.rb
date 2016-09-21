class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title,  presence: true, length: {maximum: 200}
  validates :body,length: {maximum: 600}, allow_blank: true
end
