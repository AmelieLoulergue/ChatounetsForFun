Rails.application.routes.draw do
  resources :orders
  root 'static_pages#home'
  devise_for :users
  resources :items
  resources :users, only: [:show]
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
