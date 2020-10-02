Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create' => 'sessions#create'
  get 'sessions/delete'
  root 'page#home'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
