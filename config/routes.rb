Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post 'sessions/create' => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  get 'users/new_expense' => 'users#new_expense'
  post 'users/create_expense' => 'users#create_expense'
  root 'page#home'
  resources :users, only: [:create,:destroy]
  resources :expenses, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
