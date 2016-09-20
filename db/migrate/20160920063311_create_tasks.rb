class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :priority
      t.string :status
      t.integer :progress
      t.text :description
      t.datetime :started_at
      t.datetime :due_date
      t.references :taskable, polymorphic: true, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
