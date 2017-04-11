Rails.application.routes.draw do
  devise_for :users

root 'users#index'
  namespace :admin do
    root 'users#index'
    resources :users
  end
end
