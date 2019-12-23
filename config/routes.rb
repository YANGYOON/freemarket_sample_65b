Rails.application.routes.draw do
  root to: 'Creditcards#index'
  resources :test, only: :index
  resources :Creditcards, only: :index
  devise_for :users
  
end