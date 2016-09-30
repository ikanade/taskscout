class ChangeColumn < ActiveRecord::Migration
  def change
  	remove_column :notifications, :sender_id
  	add_column :notifications, :resource_id, :integer
  end
end
