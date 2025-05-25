Rails.application.routes.draw do
  devise_for :administrators, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }
  root 'home#index'
  namespace :admins do
    root 'home#index'
  end
  get 'up' => 'rails/health#show', as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
