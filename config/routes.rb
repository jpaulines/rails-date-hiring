Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "dashboards#dashboard", as: 'dashboard'
  get 'profile/:id', to: 'pages#profile', as: :profile
  post 'bookings/:id/handle_booking', to: "bookings#handle_booking", as: :handle_booking
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :bookings, only: [ :create, :destroy]
  end

  resources :users do
    resources :reviews, only: [ :create, :destroy ]
  end
end
