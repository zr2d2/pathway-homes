Rails.application.routes.draw do

  get 'pages/about'
  get 'pages/contact'
  get 'pages/admin'

  devise_for :users
  resources :users

  resources :request_types, only: [:index]

  resources :service_requests do
    resources :notes
    get 'export', on: :collection
  end

  resources :request_types, only: [:index]

  root to: 'pages#index'
end
