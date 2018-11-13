Rails.application.routes.draw do
  resources :resources

  resources :projects do
    resources :adjustments, except: [:show, :index]
  end

  resources :clients

  resources :calendar_days, only: :index

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, shallow: true do
    resources :calendar, only: :index, controller: 'users/calendar'
  end
  resources :reports, only: :index
  resources :events, only: %i[index new create]
  root to: 'visitors#index'
end
