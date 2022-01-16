# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  root 'static_pages#home'
  resources :users do
    member do
      patch  :make_administrator
      patch  :make_user
      delete :destroy
    end
  end

  resources :ads do
    member do
      patch  :refresh
      patch  :send_to_moderate
      patch  :approve
      patch  :reject
      patch  :correct
      delete :delete_file
    end
  end

  resources :tags, only: %i[index create destroy]

  namespace :api do
    resources :tags, only: :index
  end

  namespace :my do
    resources :ads, only: :index
  end

  namespace :admin do
    resources :ads, only: :index
    resources :users, only: :index
    resources :tags, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
