Rails.application.routes.draw do
  
  get '/', to: 'routes#index', :as => 'root'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/select_route',  to: 'reservations#new'
  post '/select_route', to: 'reservations#create'
  
  resources :stops
  resources :tiers
  resources :reservations
  resources :routes
  resources :passengers
  resources :analytics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
