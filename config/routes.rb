Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
  post "/password_reset", to: "password_reset#create"
  put "/password_reset", to: "password_reset#update"

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :orders, only: [:index, :show, :create]
      end

      resources :products
      resources :categories, only: [:index, :show]
    end
  end
end
