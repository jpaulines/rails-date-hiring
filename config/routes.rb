Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: "dashboards#profile", as: 'profile'

  post 'bookings/:id/handle_booking', to: "bookings#handle_booking", as: :handle_booking
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
