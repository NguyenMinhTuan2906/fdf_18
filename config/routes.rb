Rails.application.routes.draw do
  root "home_pages#home"

  get "home_pages/home"
  get "home_pages/about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :ratings
  resources :products
  resources :comments
  resources :orders
  resources :categories
  resources :searches, except: [:edit, :update, :destroy]
end
