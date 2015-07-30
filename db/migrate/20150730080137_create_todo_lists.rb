class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.text :content
      t.boolean :chekcked
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
