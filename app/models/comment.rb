class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, length: {maximum: 300}
  validates :user, presence: true
end
