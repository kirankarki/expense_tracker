require 'sidekiq/web'

Rails.application.routes.draw do
  resources :frequencies
  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Sidekiq::Web => '/sidekiq'

  get 'search', to: 'search#search'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :budgets do
    resources :expenses
  end
end
