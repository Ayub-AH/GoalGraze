class AddPrioritytoMonthlyGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :monthly_goals, :priority, :string
  end
end
