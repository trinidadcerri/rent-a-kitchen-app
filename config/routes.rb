Rails.application.routes.draw do
  devise_for :users
  root to: "kitchens#index"
  resources :kitchens do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, only: [:create]
    get dashboard to: "pages#dashboard"
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
