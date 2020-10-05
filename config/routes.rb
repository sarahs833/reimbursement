Rails.application.routes.draw do
  resources :expenses
  get 'form' => 'expenses#add_form'
  get 'sessions/new'
  post 'sessions/create' => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  root 'page#home'
  resources :users
  resources :accounts
  get 'new_expense' => 'users#new_expense'
  post 'new_expenses' => 'users#create_expenses'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
