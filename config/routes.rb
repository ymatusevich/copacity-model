Rails.application.routes.draw do
  resources :resources
  resources :projects do
    resources :adjustments, except: [:show, :index]
  end
  resources :clients
  root to: 'visitors#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
end
