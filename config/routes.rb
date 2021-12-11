Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
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
  get 'users/profile'
  post 'users/profile'
  get 'reservations/index'
  get 'reservations/confirm'
  get 'reservations/:id', to:'reservations#confirm'
  post 'reservations/:id', to:'reservations#confirm'
  get 'reservations/:id', to:'reservations#complete'
  post 'reservations/:id', to:'reservations#complete'
  post 'reservations/:id', to:'reservations#create'
  get 'reservations/complete'
  get 'application/set_search'
  get 'rooms/create'
  post 'rooms/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :reservations
end
