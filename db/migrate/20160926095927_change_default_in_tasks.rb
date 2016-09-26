class ChangeDefaultInTasks < ActiveRecord::Migration
  def change
  	change_column_default :tasks, :progress, 0
  	change_column_default :tasks, :priority, "normal"
  	change_column_default :tasks, :status, "none"
  end
end
