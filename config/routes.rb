Rails.application.routes.draw do
  resources :stops
  resources :tiers
  resources :reservations
  resources :routes
  resources :passengers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
