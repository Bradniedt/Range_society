Rails.application.routes.draw do
  root "welcome#index"
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: "sessions#create"

  resources :search, only: [:new, :create]
end
