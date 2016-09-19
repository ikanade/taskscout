class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :deadline
      t.datetime :started_at
      t.string :status
      t.integer :progress
      t.boolean :archive
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
