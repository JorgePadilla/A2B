Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  default_url_options :host => "localhost:3000"
end
