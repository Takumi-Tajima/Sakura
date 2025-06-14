Rails.application.routes.draw do
  devise_for :users
  devise_for :administrators, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  # User profile routes
  resource :profile, only: %i[show edit update]

  resources :products, only: %i[index show]

  # Cart routes (require authentication)
  resource :cart, only: [:show]
  resources :cart_items, only: %i[create update destroy]

  # Order routes (require authentication)
  resources :orders, only: %i[new create show index]

  namespace :admins do
    resources :products
    root 'home#index'
  end

  root 'products#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
