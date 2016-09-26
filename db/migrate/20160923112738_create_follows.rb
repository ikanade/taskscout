class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true
      t.references :followable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
