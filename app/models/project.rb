class Project < ActiveRecord::Base
	belongs_to :user
	alias_attribute :creator, :user
end
