Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"

  # Routes for User Registration
  get 'signup', to: 'users#new'
  resources :users, only: [:create]

  # Routes for Login/Logout (Sessions)
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Reveal health status on /up that returns 200
  get "up" => "rails/health#show", as: :rails_health_check
end
