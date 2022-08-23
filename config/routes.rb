Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :patient
  resources :doctor
  resources :appointment
  get "/download/:id", to: 'appointment#download', as: "download"
  post '/search', to: "patient#search"
  # post "/details", to: "doctor#createdetails"
end
