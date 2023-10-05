class CreateMonthlySteps < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_steps do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.references :monthly_goals, null: false, foreign_key: true

      t.timestamps
    end
  end
end
