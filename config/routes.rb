Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items
  
  resources :users, only: [:show, :edit, :update] do
    resources :carts
    resources :orders
  end

#   scope shallow_path: "moncompte" do
#   resources :users, only: [:show, :edit, :update] do
#     resources :carts, shallow: true
#     resources :orders, shallow: true
#   end
# end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end