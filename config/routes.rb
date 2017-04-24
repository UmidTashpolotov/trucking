Rails.application.routes.draw do
  root 'orders#index'
  get 'users/show/:id' => 'users#show', as: "users_show"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :orders, only: [:show, :new, :create, :destroy] do
    resources :comments
    resources :offers, only: :create
    member do
      post :close
      post :complete
    end
  end
  resources :offers do
    member do
      post :accept
      post :reject
    end
  end
  resources :documents
  namespace :admin do
    root 'users#index'
    resources :users
  end
end