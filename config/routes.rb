# frozen_string_literal: true

Rails.application.routes.draw do
  mount Notifications::Engine => '/notifications'
  namespace :api, defaults: { format: :json } do
    resources :initiatives, only: %i(index show) do
      resources :comments, except: %i(index show new)
    end
    resources :subscriptions, only: %i(create)
    resources :contacts, only: %i(new create)
  end

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' },
                     path: :user,
                     path_names: { sign_in: :login,
                                   sign_up: :new,
                                   sign_out: :logout,
                                   password: :secret,
                                   confirmation: :verification }

  devise_for :admins, controllers: { sessions: 'admins/sessions' },
                      path: :admin,
                      path_names: { sign_in: :login,
                                   sign_up: :new,
                                   sign_out: :logout,
                                   password: :secret,
                                   confirmation: :verification }


  root 'main#index'
  namespace :admin do
    get '/main' => 'main#index'
    resources :initiatives
    namespace :initiatives, path: 'manage-initiatives' do
      resources :fundraises, only: %i(update)
      resources :rejections, only: %i(update)
      resources :implementions, only: %i(update)
      resources :locks, only: %i(update)
    end
    resources :comments, only: %i(destroy)
    resources :categories
    resources :subscriptions, only: %i(index destroy)
    resources :contacts, only: %i(index destroy)
    resources :users do
      get :role, on: :member
    end
  end
  scope module: :users, path: :user, as: :users do
    resources :initiatives do
      resources :reports, only: %i(create update destroy)
    end
    namespace :initiatives, path: 'manage-initiatives' do
      resources :confirmations, only: %i(update)
      resources :fundraises, only: %i(update)
    end
    resources :attachments, only: %i(destroy)
  end

  resources :initiatives, only: %i(index show) do
    resources :comments, except: %i(index show new)
  end

  resources :subscriptions, only: %i(create)
  resources :contacts, only: %i(new create)
  resources :categories, only: %i(show)
  resources :donations, only: %(create)

  get 'user/:id', to: 'users/users#show', as: :user
  get :search, controller: :main
end
