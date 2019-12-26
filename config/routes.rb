Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :test, only: :index
  resources :user_profiles, only: :index
  resources :creditcards
  devise_for :users
end
