Rails.application.routes.draw do
  devise_for :users
    
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  namespace :admin do
    resources :products
    resources :users
    get 'dashboard', to: 'dashboard#index'
  end
  
  root "products#index"
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show, :new, :create]

end