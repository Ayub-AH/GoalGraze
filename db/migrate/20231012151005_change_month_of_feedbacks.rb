class ChangeMonthOfFeedbacks < ActiveRecord::Migration[7.0]
  def change
    change_column(:feedbacks, :month, :string)
  end
end
