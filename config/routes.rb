Rails.application.routes.draw do
  resources :resources

  resources :projects do
    resources :adjustments, except: [:show, :index]
  end

  resources :clients do
    resources :projects, only: :index
  end

  resources :calendar_days, only: :index

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :reports, only: :index

  root to: 'visitors#index'
end
