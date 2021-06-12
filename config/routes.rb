Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  } 
  resources :companies
  # resources :users
  resources :teams
  resources :hobbies
  resources :foods

  resources :sessions, only: [:create]  
  # get '/logged_in', to: 'sessions#logged_in'
  delete 'logout', to: 'sessions#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
