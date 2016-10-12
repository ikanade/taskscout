class Notification < ActiveRecord::Base
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  validates_presence_of :recipient_id, :resource_id
end
