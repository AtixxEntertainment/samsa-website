require "admin_constraint"

SamsaWebsite::Application.routes.draw do
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "/logout", to: "sessions#destroy", as: :logout

  get :admin, to: "admin#index", constraints: AdminConstraint.new

  namespace :admin do
    resources :preferences
    resources :media
    resources :header_characters
    resources :posts do
      collection do
        post :preview
      end
    end
    resources :users do
      member do
        get :admin
        get :ban
      end
    end
  end

  root "home#index"

  get "*a", to: "application#routing_error"
end
