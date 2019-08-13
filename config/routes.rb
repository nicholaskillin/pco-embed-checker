Rails.application.routes.draw do
  
  get 'donation_forms/show'
  get 'donation_forms/index'
  root 'widgets#index'
  get 'sessions/new'
  get 'login', to: redirect('/auth/planning_center'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  post '/login', to: 'sessions#create'
  resources :widgets
  resources :forms
  resources :donation_forms
  
end