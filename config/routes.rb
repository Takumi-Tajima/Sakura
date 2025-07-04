Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords' }

  namespace :admins do
    root 'home#index'
  end

  root 'users/home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
