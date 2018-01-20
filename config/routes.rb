Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]

  resources :items, except: [:show]

  resources :orders, only: [:create, :destroy, :show, :update, :confirm]

  resources :order_items, only: [:create, :update, :destroy]

  root 'items#index'

  get 'confirm', to: 'orders#confirm', as: 'confirm'
  get 'logout', to: 'sessions#destroy'

  get "*any", via: :all, to: "errors#not_found", as: 'not_found'
end

