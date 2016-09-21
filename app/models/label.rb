class Label < ActiveRecord::Base
  belongs_to :labelable, polymorphic: true
  validates :name, presence: true
  validates :color, presence: true
end
