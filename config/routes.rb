require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'
  mount Sidekiq::Web => '/sidekiq'  

  get 'search', to: 'search#search' 
  
  devise_for :users
  
  resources :budgets do
    resources :expenses
  end
end
