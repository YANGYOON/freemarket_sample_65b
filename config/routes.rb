Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'phone_numbers', to: 'users/registrations#new_phone_number'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "signup#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
