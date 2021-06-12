Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :users
  resources :teams
  resources :hobbies
  resources :foods
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
