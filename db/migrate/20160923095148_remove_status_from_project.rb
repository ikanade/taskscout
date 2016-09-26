class RemoveStatusFromProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :status
  end
end
