Rails.application.routes.draw do
  root to: 'creditcards#index'
  resources :test, only: :index
  resources :creditcards
  devise_for :users
  
end