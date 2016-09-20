class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable
  belongs_to :user

  validates :taskable_type , presence: true, inclusion: { within: %w(Project Task) }
  
end
