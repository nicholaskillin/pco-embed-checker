Rails.application.routes.draw do
  
  root 'widgets#index'
  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get 'login', to: redirect('/auth/planning_center'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :widgets
  resources :forms
  
end