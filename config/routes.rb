Rails.application.routes.draw do
  devise_for :users, controllers: {
    :omniauth_callbacks => "users/omniauth_callbacks",
  }
  root 'root#index'
  resources :users

  get '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'authentication#callback'
end
