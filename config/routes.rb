Rails.application.routes.draw do
  resources :resources

  resources :projects do
    resources :adjustments, except: [:show, :index]
  end

  resources :clients

  resources :calendar_days, only: :index

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'visitors#index'
end
