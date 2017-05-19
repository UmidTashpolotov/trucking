Rails.application.routes.draw do
  root 'orders#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :update]
  resources :cars, only: [:create, :edit, :update, :destroy, :show]

  get :my_profile, to: 'users#show'
  scope 'my_profile' do
    get :edit, to: 'users#edit'
    get :add_car, to: 'cars#new'
  end

  resources :orders, except: [:edit, :update] do
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