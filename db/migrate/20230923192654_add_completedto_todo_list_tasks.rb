class AddCompletedtoTodoListTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :todo_list_tasks, :completed, :boolean, default: false
  end
end
