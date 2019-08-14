Rails.application.routes.draw do
  
  get 'donation_forms/show'
  get 'donation_forms/index'
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
  resources :donation_forms
  namespace :api do 
    namespace :v1 do 
     resources :donation_forms, only: [:index, :create]
    end 
  end 
  
end