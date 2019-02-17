Rails.application.routes.draw do
  root "welcome#index"
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: "sessions#create"

  get '/search', to: "search#new", as: :new_search
  post '/search', to: "search#create", as: :create_search

  get '/map', to: "map#show"
  get '/dashboard', to: "dashboard#show"

  namespace :admin do
    get 'dashboard', as: 'dashboard', to: 'users#index'
  end

  resources :charge_spots, only: [:new]
end
