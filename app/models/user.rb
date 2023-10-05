class User < ApplicationRecord
  has_many :todo_list_tasks
  has_many :monthly_goals
  has_many :feedbacks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
