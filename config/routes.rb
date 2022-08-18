Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :patient
  resources :doctor
  resources :appointment
  post '/search', to: "patient#search"
  # post "/details", to: "doctor#createdetails"
end
