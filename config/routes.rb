Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "kitchens#index"
  resources :kitchens do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:create]
  end
  get '/dashboard', to: 'pages#dashboard'
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
