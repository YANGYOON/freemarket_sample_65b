Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'phone_numbers', to: 'users/registrations#new_phone_number'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'creditcards#new'
  resources :items do
    resources :purchase do
      collection do
        get 'buy'
        post 'pay'
      end
    end
  end
  # root to: 'users#index'
  resources :test, only: :index
  resources :user_profiles, only: :index
  resources :creditcards
  resources :users
end
