Rails.application.routes.draw do
  root 'orders#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :edit, :update]
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
    resources :users do
      collection do
        get :inactive
      end
      member do
        post :activate
        post :deactivate
        get :show_docs
      end
    end
  end
end