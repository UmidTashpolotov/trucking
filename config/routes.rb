Rails.application.routes.draw do
  get 'users/show/:id' => 'users#show', as: "users_show"
  devise_for :users
  resources :orders, only: [:show, :new, :create, :destroy] do
    resources :comments
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

  root 'orders#index'
  namespace :admin do
    root 'users#index'
    resources :users
  end
end