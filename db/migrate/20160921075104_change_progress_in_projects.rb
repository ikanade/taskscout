class ChangeProgressInProjects < ActiveRecord::Migration
  def change
  	change_column_default :projects, :progress, 0
  end
end
