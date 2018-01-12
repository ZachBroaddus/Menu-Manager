Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  # restful convention
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]

  resources :items, except: [:show]

  root "items#index"

  # optional custom routing
  # get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all
end

