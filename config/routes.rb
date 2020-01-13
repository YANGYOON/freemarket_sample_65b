Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'devise/sessions'
  }
  devise_scope :user do
    get 'users', to: 'users/registrations#index'
    get 'phone_numbers', to: 'users/registrations#new_phone_number'
    get 'signup_creditcards', to: 'users/registrations#signup_creditcard'
    get 'addresses', to: 'users/registrations#new_address'
    post 'signup_create', to: 'users/registrations#signup_create'
  end
  root to: 'items#index'
  resources :items do
    collection do
      get 'category_children'
      get 'category_grandchildren'
      get 'set_sizes'
      get 'cal_profit'
    end
    collection do
      get 'search'
    end
    resources :purchase do
      collection do
        get 'buy'
        post 'pay'
        get 'done'
      end
    end
    resources :comments, only: :create
  end
  resources :test, only: :index
  resources :user_profiles, only: :index
  resources :creditcards, only: [:create, :new, :index, :show, :destroy]
  resources :users
  resources :categories, only: [:index, :show]
end