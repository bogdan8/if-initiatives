# frozen_string_literal: true

Rails.application.routes.draw do
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
    resources :initiatives do
      get :pending_approval, on: :collection
      get :fundraising_finished, on: :collection
      get :report, on: :collection
      get :audit_implemented, on: :collection
      get :finish_fundraising, on: :member
      get :success_confirmation, on: :member
      get :error_confirmation, on: :member
      get :started_implement, on: :member
      get :insufficient_funds, on: :member
      get :check_implemented, on: :member
      get :implemented, on: :member
      get :unrealized, on: :member
      get :locked, on: :member
      resources :comments, only: %i[destroy]
    end
    resources :categories
    resources :users do
      get :role, on: :member
    end
  end
  scope module: :users, path: :user, as: :users do
    resources :initiatives, except: %i[destroy] do
      get :for_confirmation, on: :member
      resources :comments, except: %i[index show]
    end
  end
  resources :initiatives, only: %i[index show] do
    resources :comments, except: %i[index show new destroy]
  end
end
