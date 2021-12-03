# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  root 'static_pages#home'
  resources :ads
  namespace :admin do
    resources :users
  end
  namespace :admin do
    resource :ads
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
