Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :update, :delete, :show]
  post '/register', to: 'users#create'
  match '/register', to: 'users#create', via: [:options]
end
