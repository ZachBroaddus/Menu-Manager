Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]

  resources :items, except: [:show]

  resources :orders, only: [:create, :destroy, :show, :update, :confirm]

  resources :order_items, only: [:create, :update, :destroy]

  resources :password_resets, except: [:show, :index, :destroy]

  root 'items#index'

  get 'confirm', to: 'orders#confirm', as: 'confirm'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'

  get "*any", via: :all, to: "errors#not_found", as: 'not_found'
end

