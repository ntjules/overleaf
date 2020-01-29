Rails.application.routes.draw do

  # root :to => "tasks#tasks", as: "all_tasks"
  # post "/", to: "tasks#tasks"

  get "tasks", to: "tasks#tasks", as: "all_tasks"
  root :to => "users#new", as: "homepage"

  patch "/tasks/:id/stop" => "tasks#stop_stask", as: "stop_task"
  patch "/tasks/:id/done" => "tasks#done_stask", as: "done_task"
  patch "/tasks/:id/restart" => "tasks#restart_stask", as: "restart_task"
  patch "/tasks/:id/start" => "tasks#start_stask", as: "start_task"

  get "/tasks" => "tasks#tasks"
  resources :tasks, :except => [:index]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  # get 'tasks/tasks'

  namespace :admin do
    resources :users
    patch "/users/:id/makeadmin" => "users#makeadmin", as: "makeadmin"
  end
end
