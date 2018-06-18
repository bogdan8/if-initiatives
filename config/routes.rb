# frozen_string_literal: true

Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  namespace :api, defaults: { format: :json } do
    resources :initiatives, only: %i[index show] do
      resources :comments, except: %i[index show new]
    end
    resources :subscriptions, only: %i[create]
    resources :contacts, only: %i[new create]
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' },
                     path: :user,
                     path_names: { sign_in: :login,
                                   sign_up: :new,
                                   sign_out: :logout,
                                   password: :secret,
                                   confirmation: :verification }
  root 'home#index'
  namespace :administration do
    get '/home' => 'home#index'
    resources :initiatives do
      get :to_fundraising, on: :member
      get :to_rejected, on: :member
      get :to_fundraised, on: :member
      get :to_implementing, on: :member
      get :to_unimplemented, on: :member
      get :to_implemented, on: :member
      get :to_locked, on: :member
      get :confirmating, on: :collection
      get :fundraising, on: :collection
      get :implementing, on: :collection
    end
    resources :comments, only: %i[destroy]
    resources :categories
    resources :subscriptions, only: %i[index destroy]
    resources :contacts, only: %i[index destroy]
    resources :users do
      get :role, on: :member
    end
  end
  scope module: :users, path: :user, as: :users do
    resources :initiatives do
      resources :reports, only: %i[create update destroy]
      get :to_fundraised, on: :member
      get :to_confirmating, on: :member
    end
    resources :attachments, only: %i[destroy]
  end
 
  resources :initiatives, only: %i[index show] do
    resources :comments, except: %i[index show new]
  end
  
  resources :subscriptions, only: %i[create]
  resources :contacts, only: %i[new create]
  resources :categories, only: %i[show]

  post :liqpay, controller: :donations
  get 'user/:id', to: 'users/users#show', as: :user
  get :search, controller: :home
  get '*path' => 'static#index', constraints: lambda { |req| req.format != 'json' }
end
