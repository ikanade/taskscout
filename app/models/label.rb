class Label < ActiveRecord::Base
  belongs_to :labelable, polymorphic: true

end
