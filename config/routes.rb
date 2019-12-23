Rails.application.routes.draw do
  root to: 'creditcards#index'
  resources :test, only: :index
  resources :creditcards, only: :index
  devise_for :users
  
end