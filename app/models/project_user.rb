class ProjectUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user, scope: :project
end
