# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :initiatives do
    resources :comments, except: %i[index show new]
  end
  resources :categories
end
