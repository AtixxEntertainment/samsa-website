require "admin_constraint"

SamsaWebsite::Application.routes.draw do
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "/logout", to: "sessions#destroy", as: :logout

  get :admin, to: "admin#index", constraints: AdminConstraint.new

  namespace :admin do
  end

  root "home#index"

  get "*a", to: "application#routing_error"
end
