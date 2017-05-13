Rails.application.routes.draw do
  root to: 'home#index'

  resources :expenses
  resources :budgets
  devise_for :users
end
