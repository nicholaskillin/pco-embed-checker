Rails.application.routes.draw do
  
  get 'forms/index'
  get 'forms/create'
  get 'forms/show'
  get 'forms/destroy'
  root 'widgets#index'
  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :widgets
  resources :users
  
end