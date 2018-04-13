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
      get :to_fundraising, on: :member
      get :to_rejected, on: :member
      get :to_fundraised, on: :member
      get :to_implementing, on: :member
      get :to_unimplemented, on: :member
      get :to_reporting, on: :member
      get :to_implemented, on: :member
      get :to_locked, on: :member
      get :confirmating, on: :collection
      get :fundraising, on: :collection
      get :implementing, on: :collection
      get :reporting, on: :collection
      resources :comments, only: %i[destroy]
    end
    resources :categories
    resources :users do
      get :role, on: :member
    end
  end
  scope module: :users, path: :user, as: :users do
    resources :initiatives, except: %i[destroy] do
      get :to_confirmating, on: :member
    end
  end
  resources :initiatives, only: %i[index show] do
    resources :comments, except: %i[index show new]
  end
end
