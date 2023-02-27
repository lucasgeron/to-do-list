Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  # define uma rota para o método toggle, que está no controller tasks
  post "tasks/:id/toggle", to: "tasks#toggle"
end
