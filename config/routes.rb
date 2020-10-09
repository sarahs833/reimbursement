Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create' => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  root 'page#home'
  resources :users
  resources :accounts, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
