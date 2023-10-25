class User < ApplicationRecord
  has_many :todo_list_tasks, dependent: :destroy
  has_many :monthly_goals, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
