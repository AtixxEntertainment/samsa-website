require "admin_constraint"

SamsaWebsite::Application.routes.draw do
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]

  get "login", to: "sessions#index", as: :login
  get "logout", to: "sessions#destroy", as: :logout
  post "game_download", to: "game_download#create"

  resources :products, only: :index
  resources :news, only: :index

  concern :commentable do
    member do
      get :random_comment
    end
    resources :comments, only: :create do
      member do
        post "vote/:value", to: "comments#vote", as: :vote
      end
    end
  end

  resources :pages, only: :show do
    concerns :commentable
  end
  resources :posts, path: :news, only: :show do
    concerns :commentable
  end

  get :admin, to: "admin#index", constraints: AdminConstraint.new
  namespace :admin do
    resources :pages, only: [:index, :show]
    resources :preferences
    resources :media
    resources :header_characters
    resources :products
    resources :game_versions
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
    resources :comments do
      member do
        post :toggle
      end
    end
  end

  root "pages#index"

  get "/:id", to: "posts#show"
end
