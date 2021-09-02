Rails.application.routes.draw do
  resources :categories
  mount ForestLiana::Engine => '/forest'
  root 'items#index'
  devise_for :users
  resources :items
  
  # resources :users, only: [:show, :edit, :update], path:'' do
  #   resources :carts, path: "monpanier"
  #   resources :orders, path: "mescommandes"
  # end

  scope shallow_prefix: "user" do
  resources :users, only: [:show, :edit, :update] do
    resources :carts, shallow: true, path: "monpanier"
    resources :orders, shallow: true, path: "mescommandes"
  end
end

namespace :admin do
  resources :users, :items, :orders
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end