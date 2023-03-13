Rails.application.routes.draw do
  devise_for :users
  root to: "kitchens#index"
  resources :kitchens do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:create]
  end
  get '/dashboard', to: 'pages#dashboard'
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
