Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  root 'foods#index'

  resources :foods, only: %i[index show]

  namespace :admins do
    root 'foods#index'
    resources :foods, only: %i[index show new create edit update destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
