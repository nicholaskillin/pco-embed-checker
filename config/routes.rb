Rails.application.routes.draw do
  
  get 'donation_forms/show'
  get 'donation_forms/index'
  root 'widgets#index'
  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :widgets
  resources :users
  resources :donation_forms
  
end