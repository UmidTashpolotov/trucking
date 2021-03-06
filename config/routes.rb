Rails.application.routes.draw do
  authenticated :user do
    root 'orders#index'
  end

  root 'pages#index'

  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:show, :update] do
    collection do
      post :sms_verify
      get :sms_verify_form
      post :send_sms_code
      get :reset_password_form
      post :reset_password
    end
    member do
      post :check_phone
    end
  end
  resources :cars, only: [:create, :edit, :update, :destroy, :show]
  resources :bids, only: [:new, :create]

  get :my_profile, to: 'users#show'
  scope 'my_profile' do
    get :edit, to: 'users#edit'
    get :add_car, to: 'cars#new'
  end

  resources :orders, except: [:edit, :update] do
    collection do
      get :my
    end
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

    resources :bids do
      collection do
        get :search_results
      end
      member do
        get :close
      end
    end

    resources :users do
      collection do
        get :inactive
        get :search_results
      end
      member do
        post :activate
        post :deactivate
        get :show_docs
      end
    end
  end
end