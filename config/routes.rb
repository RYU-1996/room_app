Rails.application.routes.draw do
  devise_for :users
  root 'top#hello'
  post '/', to: 'top#hello'
  get 'top/hello'
  get 'users/index'
  post 'users/create'
  get 'rooms/index'
  get 'users/login'
  post 'users/login'
  delete 'users/logout'
  get 'application/search'
  get 'users/account'
  post 'users/profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
end
