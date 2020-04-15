Rails.application.routes.draw do
  # 会員側のルーティング
  devise_for :customers, controlloers: {
  	sessions:      'devise/customers/sessions',
  	registrations: 'devise/customers/registrations'

  }

  root 'home#top'
  resources :products,   only: [:show, :index]
  resources :deliveries, only: [:index, :edit, :update, :create, :destroy]
  resources :carts,      only: [:index, :create, :destroy, :update]
  delete 'carts/empty',  to: 'carts#empty_cart'
  resources :orders,     only: [:new, :create, :index, :show]
  get 'orders/confirm',  to: 'orders#confirm'
  get 'orders/finish',   to: 'orders#finish'
  resource :customer,    only: [:show, :edit, :update]
  get 'customers/confirm', to: 'customers#confirm'


  # 店側のルーティング
  devise_for :admins, controlloers: {
  	sessions:      'devise/admins/sessions',
  	registrations: 'devise/admins/registrations'
  }

  namespace :admin do
  	root 'home#top'
  	resources :products,      only: [:new, :show, :index, :create, :update, :edit]
  	resources :customers,     only: [:show, :index, :edit, :update]
  	resources :genres,        only: [:index, :create, :edit, :update]
  	resources :orders,        only: [:index, :show, :update]
  	resources :product_items, only: [:update]
  end
end
