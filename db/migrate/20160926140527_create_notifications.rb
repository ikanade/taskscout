class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.text :body
      t.integer :recipient_id
      t.integer :sender_id
      t.string :category

      t.timestamps null: false
    end
  end
end
