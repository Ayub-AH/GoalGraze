class AddCompletedToMonthlySteps < ActiveRecord::Migration[7.0]
  def change
    add_column :monthly_steps, :completed, :boolean, default: false
  end
end
