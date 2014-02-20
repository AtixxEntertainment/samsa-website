SamsaWebsite::Application.routes.draw do
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "/logout", to: "sessions#destroy", as: :logout

  get "*a", to: "application#routing_error"
end
