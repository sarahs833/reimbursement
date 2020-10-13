Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post 'sessions/create' => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  root 'page#home'
  resources :users, only: [:create,:destroy]
  resources :accounts, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
