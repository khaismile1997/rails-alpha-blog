# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'pages/home'
  # get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
end
