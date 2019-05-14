Rails.application.routes.draw do
  
  get 'donation_forms/show'
  get 'donation_forms/index'
  root 'widgets#index'
  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :widgets
  resources :forms
  resources :donation_forms
  
end