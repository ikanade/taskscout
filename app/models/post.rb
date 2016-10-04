class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, as: :commentable
  acts_as_followable
  after_create :set_creator_as_follower
  validates :title,  presence: true, length: {maximum: 200}
  validates :body,length: {maximum: 600}, allow_blank: true


  def set_creator_as_follower
  	self.user.follow(self)
  end
end
