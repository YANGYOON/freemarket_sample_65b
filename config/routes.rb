Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'phone_numbers', to: 'users/registrations#new_phone_number'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'
  resources :items do
    collection do
      get 'category_children'
      get 'category_grandchildren'
      get 'set_sizes'
      get 'cal_profit'
    end
  end
  resources :test, only: :index
  resources :user_profiles, only: :index
  resources :creditcards
  resources :users
  resources :categories, only: [:index, :show]
  
end
