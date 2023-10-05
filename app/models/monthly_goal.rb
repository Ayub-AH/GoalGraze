class MonthlyGoal < ApplicationRecord
  belongs_to :user
  has_many :monthly_steps
  validates :priority, inclusion: { in: ["Low Priority" , "Medium Priority" , "High Priority"]}
end
