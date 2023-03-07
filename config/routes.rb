Rails.application.routes.draw do
  root to: "kitchens#index"
  resources :users, except: [:index] do
    resources :kitchens,
    resources :bookings, only: [:new :create :show]
    resources :reviews, only: [:create]
  end
  resources :kitchens, only: :edit :destroy do
    resources :reviews, only: [:create]
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
