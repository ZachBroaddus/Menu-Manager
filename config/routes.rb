Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]

  resources :items, except: [:show]

  resources :orders, only: [:create, :destroy]

  root "items#index"

  get 'logout', to: 'sessions#destroy'

  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all
end

