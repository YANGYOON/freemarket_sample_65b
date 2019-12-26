Rails.application.routes.draw do
  root to: 'user_profiles#index'
  resources :items, only: :index
  resources :test, only: :index
  resources :user_profiles, only: :index
  resources :creditcards
  devise_for :users
end
