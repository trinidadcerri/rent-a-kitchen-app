Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  # ! Check plural or singular for users
  devise_for :user, controllers: {
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
  get 'booking/:id/accept', to: 'bookings#accept', as: :accept
  get 'booking/:id/decline', to: 'bookings#decline', as: :decline
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
