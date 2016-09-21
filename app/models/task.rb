class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable
  belongs_to :user
  has_many :comments
  has_many :labels, as: :labelable

 # validates_associated :posts
  validates :taskable_type , presence: true, inclusion: { within: %w(Project Task) }
  validates_datetime :due_date, after: :started_at 
  validates :title,  presence: true, length: {maximum: 200}
  #validates :description, allow_blank: true
  validates :priority, presence: true,inclusion: {in: %w(low normal high ASAP)}
  validates :status, presence: true,format: { with: /\A[a-z]+\z/i }
  validates :progress, presence: true ,
  numericality: { only_integer: true }, length: {maximum: 3}
  #validates :is_valid_date?



  private
	#def is_valid_date?
	#  if((due_date.is_a?(Date) rescue ArgumentError) == ArgumentError)
	#    errors.add(:due_date, 'Sorry, Invalid Date.')
	#  end
	#end
end
