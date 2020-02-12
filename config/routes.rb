Rails.application.routes.draw do
  
  get '/signup', to: 'passengers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :stops
  resources :tiers
  resources :reservations
  resources :routes
  resources :passengers, only: [:show, :new, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end