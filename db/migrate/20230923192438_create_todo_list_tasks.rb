class CreateTodoListTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_list_tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
