Rails.application.routes.draw do
  resources :resources
  resources :projects do
    resources :adjustments, except: [:show, :index]
  end
  resources :calendar_days, only: :index
  resources :clients

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'visitors#index'
end
