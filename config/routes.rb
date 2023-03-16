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
  get 'booking/:id/accept', to: 'bookings#accept', as: :accept
  get 'booking/:id/decline', to: 'bookings#accept', as: :decline
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
