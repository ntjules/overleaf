Rails.application.routes.draw do
  root :to => "tasks#tasks" ,as:'all_tasks'
  # post    '/'         ,to: 'tasks#create'
  resources :tasks
  # get 'tasks/tasks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
