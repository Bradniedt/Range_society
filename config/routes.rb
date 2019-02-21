Rails.application.routes.draw do
  root "welcome#index"
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: "sessions#create"

  get '/search', to: "search#new", as: :new_search
  post '/search', to: "search#create", as: :create_search
  post '/ev_search', to: "ev_search#create", as: :create_ev_search

  get '/map', to: "map#show"
  get '/ev_map', to: "ev_map#show"

  get '/about', to: "about#index", as: :about
<<<<<<< HEAD
  get '/leaderboard', to: "leaderboard#index"
  get '/logout', to: 'sessions#destroy', as: "logout"
=======
  get '/logout', to: 'sessions#destroy', as: "logout"
  get '/leaderboard', to: "leaderboard#index"
  
>>>>>>> 362ccd94b8ec582d6d2cd8eb0461dc4d6201fd09
  namespace :admin do
    get 'dashboard', as: 'dashboard', to: 'users#index'
    resources :users, only: [:index, :update]
  end

  namespace :dashboard do
    get '/', to: "users#show"
    resources :trip_logs, only: [:new, :create, :index]
  end
  resources :charge_spots, only: [:new]
end
