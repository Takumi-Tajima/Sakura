Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  root 'foods#index'

  resources :foods, only: %i[index show]

  namespace :admins do
    root 'foods#index'
    resources :foods, only: %i[index show new create edit update destroy] do
      resource 'position', only: %i[update], module: :foods
    end
  end

  namespace :users do
    resource :cart, only: %i[show] do
      resources :cart_items, only: %i[new create update destroy], module: :carts
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
