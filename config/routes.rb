Rails.application.routes.draw do
  resources :feedbacks
  resources :monthly_steps
  resources :monthly_goals
  resources :todo_list_tasks do
    member do
      post "move_to_completed"
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todo_list_tasks#index"
end
