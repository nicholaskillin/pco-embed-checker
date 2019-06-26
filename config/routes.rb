Rails.application.routes.draw do
  
  get 'donation_forms/show'
  get 'donation_forms/index'
  root 'widgets#index'
  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get 'login', to: redirect('/auth/planning_center'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  # This needs deleted
  get '/yay', to: 'static_pages#yay'
  get '/boo', to: 'static_pages#boo'
  # End deleting
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :widgets
  resources :forms
  resources :donation_forms
  
end