# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  root 'static_pages#home'
  namespace :api do
    resources :tags, only: :index
  end
  resources :ads do
    member do
      patch  :refresh
      patch  :send_to_moderate
      patch  :correct
      delete :delete_file
    end
  end
  namespace :my do
    resources :ads, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
