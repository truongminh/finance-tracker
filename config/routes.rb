Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  get 'users/my_portfolio'
  devise_for :users
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"

  get "my_portfolio", to: "users#my_portfolio"
  get "search_stock", to: "stocks#search"

  get "my_friends", to: "users#my_friends"
  get "search_friend", to: "users#search"
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
end
