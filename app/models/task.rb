class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable
  belongs_to :user

  validates :taskable_type , presence: true, inclusion: { within: %w(Project Task) }
  validates_datetime :due_date, :after => :started_at 
  validates :title,  presence: true, length: {is: 200}
  validates :description, allow_blank: true
  
end
