Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :products
      resources :categories
    end
  end

  resources :products
  resources :categories
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
