Rails.application.routes.draw do
  devise_for :users
  devise_for :administrators, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  namespace :admins do
    root 'foods#index'
    resources :foods, only: %i[index show new create edit update destroy]
  end

  root 'users/home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
