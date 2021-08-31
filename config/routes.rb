Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items
  resources :users, only: [:show, :edit, :update] do
    resources :carts
    resources :orders
  end


  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
