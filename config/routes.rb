Rails.application.routes.draw do
  root to: 'test#index'
  resources :test, only: :index
  devise_for :users
  
end
