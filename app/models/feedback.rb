class Feedback < ApplicationRecord
  belongs_to :user
  validates :title, :content, :month, presence: true
  validates :month, inclusion: { in: ["January" , "February" , "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]}
  validates :user_id, uniqueness: { scope: :month }
end
