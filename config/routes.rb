Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:create, :destroy]

  resources :items, only: [:new, :create, :update, :destroy, :index]

  root "items#index", as: "menu"

  get 'logout', to: "sessions#destroy", as: 'logout'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
