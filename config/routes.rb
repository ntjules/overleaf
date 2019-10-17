Rails.application.routes.draw do
  root :to => "tasks#tasks", as: "all_tasks"
  post "/", to: "tasks#tasks"
  patch "/tasks/:id/stop" => "tasks#stop_stask", as: "stop_task"
  patch "/tasks/:id/done" => "tasks#done_stask", as: "done_task"
  patch "/tasks/:id/restart" => "tasks#restart_stask", as: "restart_task"
  patch "/tasks/:id/start" => "tasks#start_stask", as: "start_task"
  get "/tasks" => "tasks#tasks"
  resources :tasks, :except => [:index]
  # get 'tasks/tasks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
