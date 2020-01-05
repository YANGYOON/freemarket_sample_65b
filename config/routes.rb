Rails.application.routes.draw do

  devise_for :users, controllers: {
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
    resources :purchase do
      collection do
        get 'buy'
        post 'pay'
      end
    end
  end
  resources :test, only: :index
  resources :user_profiles, only: :index
  resources :creditcards, only: [:create, :new, :index, :destroy]
  resources :users
end
