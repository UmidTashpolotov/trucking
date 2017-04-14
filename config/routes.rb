Rails.application.routes.draw do
  devise_for :users
  resources :orders, only: [:show]

root 'orders#index'
  namespace :admin do
    root 'users#index'
    resources :users
  end
end
