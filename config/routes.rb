# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'dashboards#index'
  get 'about' => 'dashboards#about', as: 'about'
  get 'what_to_pack' => 'dashboards#what_to_pack', as: 'what_to_pack'
  get 'parents_guide' => 'dashboards#parents_guide', as: 'parents_guide'
  get 'contact' => 'dashboards#contact', as: 'contact'
  post 'new_contact' => 'dashboards#new_contact', as: 'new_contact'
  get 'my_application' => 'dashboards#my_application', as: 'my_application'
  post 'search' => 'dashboards#search', as: 'search'
  get 'unihub_applications/universities_for_country' => 'unihub_applications#universities_for_country',
      as: 'universities_for_country'
  get 'unihub_applications/degrees_for_university' => 'unihub_applications#degrees_for_university',
      as: 'degrees_for_university'
  get 'unihub_applications/courses_for_degree' => 'unihub_applications#courses_for_degree',
      as: 'courses_for_degree'

  resources :universities, only: [:show]
  resources :unihub_applications
  resources :courses, only: [:show]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
