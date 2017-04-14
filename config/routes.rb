Rails.application.routes.draw do

  devise_for :users
  resources :orders, only: [:show]
  resources :offers, only: [:create]

root 'orders#index'
  namespace :admin do
    root 'users#index'
    resources :users
  end
end
