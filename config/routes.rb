Rails.application.routes.draw do
  resources :pending_user_groups
  resources :user_groups
  resources :comments
  resources :posts
  resources :groups
  resources :photos
  resources :users, param: :username, only: [:create, :update, :show, :index]
    post '/auth', to: 'auth#create'
    get '/auth', to: 'auth#show'
    post '/users/:username', to: 'users#update'
    get '/user/:username', to: 'users#show'
    get '/users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
