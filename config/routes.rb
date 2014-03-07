require "admin_constraint"

SamsaWebsite::Application.routes.draw do
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "/logout", to: "sessions#destroy", as: :logout

  get :admin, to: "admin#index", constraints: AdminConstraint.new

  resources :posts, only: :show do
    resources :comments, only: :create do
      collection do
        post :like
        post :dislike
      end
    end
  end

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
