Rails.application.routes.draw do
  
  get 'users/new'
  root 'widgets#index'
  resources :widgets
  
end