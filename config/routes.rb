Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  resources :users
  post 'mostrar' => 'bookings#createdate'
  root 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
