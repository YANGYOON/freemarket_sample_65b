Rails.application.routes.draw do
  root to: 'user_profiles#index'
  resources :test, only: :index
  resources :user_profiles, only: :index
  devise_for :users

end
