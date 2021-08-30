Rails.application.routes.draw do
  get 'users/create'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get 'users/destroy'
  get 'users/update'
  devise_for :users
  root 'static_pages#home'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
