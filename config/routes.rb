Rails.application.routes.draw do
  resources :user_groups
  resources :comments
  resources :posts
  resources :groups
  resources :photos
  resources :users, param: :username, only: [:create]
    post '/auth', to: 'auth#create'
    get '/auth', to: 'auth#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
