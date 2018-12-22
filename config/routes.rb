Rails.application.routes.draw do
  resources :variables
  resources :distances
  resources :costs
  resources :cities
  resources :charges
  resources :trips
 # resources :charges, only: [:new, :create]
  root to: 'visitors#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  default_url_options :host => "localhost:3000"
end
