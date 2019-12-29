Rails.application.routes.draw do
  root to: 'items#index'
  resources :test, only: :index
  devise_for :users
  resources :items do
    collection do
      get 'category_children'
      get 'category_grandchildren'
      get 'set_sizes'
    end
  end
end
