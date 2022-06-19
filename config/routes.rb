# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'dashboards#index'
  get 'about' => 'dashboards#about', as: 'about'
  get 'contact' => 'dashboards#contact', as: 'contact'
  post 'new_contact' => 'dashboards#new_contact', as: 'new_contact'
  get 'my_application' => 'dashboards#my_application', as: 'my_application'

  resources :universities, only: [:show]
  resources :unihub_applications

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
