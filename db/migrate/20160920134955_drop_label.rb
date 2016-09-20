class DropLabel < ActiveRecord::Migration
  def change
  	drop_table :labels
  end
end
