Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "characters#index"

  resources :characters do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index, :new, :create]
  end
  resources :bookings, only: [:edit, :update, :destroy]
  get "/dashboard", to: "bookings#index", as: :dashboard
  patch "/bookings/:id/accept", to: "bookings#accept", as: :accept
  patch "/bookings/:id/decline", to: "bookings#decline", as: :decline
  get "/mycharacters", to: "characters#mychars", as: :mychars

end
