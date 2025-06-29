Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  resources :foods, only: %i[index show]

  namespace :admins do
    root 'foods#index'
    resources :foods, only: %i[index show new create edit update destroy] do
      resource 'position', only: %i[update], module: :foods
    end
  end

  root 'foods#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
