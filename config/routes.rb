Rails.application.routes.draw do
  root to: 'items#index'
  resources :test, only: :index
  devise_for :users
  resources :items
end
