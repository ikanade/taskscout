class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable
  belongs_to :user

  validates :taskable_type , presence: true, inclusion: { within: %w(Project Task) }
  validates_datetime :due_date, :after => :started_at 
  validates :title,  presence: true, length: {is: 200}
  validates :description, allow_blank: true
  validates :priority, presence: true,inclusion: {in: %w(low normal high ASAP)}
  validates :status, presence: true
  validates_format_of :status,:with => ^[A-Za-z]+$ 
  validates :progress, presence: true, numericality: { only_integer: true }, length: {in: 1..3}
  validate :is_valid_date?
  private
	def is_valid_date?
	  if((due_date.is_a?(Date) rescue ArgumentError) == ArgumentError)
	    errors.add(:due_date, 'Sorry, Invalid Date.')
	  end
	end
end
