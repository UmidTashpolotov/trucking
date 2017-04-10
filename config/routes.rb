Rails.application.routes.draw do
  get 'users/index'

root 'users#index'
  namespace :admin do
    root 'users#index'
    resources :users
  end
end
