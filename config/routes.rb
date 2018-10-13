Rails.application.routes.draw do
  root 'root#index'
  resources :users

  get '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'authentication#callback'
end
