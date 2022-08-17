Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :patient
  resources :doctor
  # post "/details", to: "doctor#createdetails"
end
