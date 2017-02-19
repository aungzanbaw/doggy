Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :products
      resources :categories
      post 'login', to: "categories#login"
      get 'auth', to: 'categories#auth'
      post 'accept_order'
    end
  end

  resources :products
  resources :categories
  resources :users

  root "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
