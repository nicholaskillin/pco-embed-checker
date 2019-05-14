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
<<<<<<< HEAD
  resources :widgets
  resources :forms
=======
>>>>>>> 9023df14e9a068a31be48f4654fee530b0157894
  resources :donation_forms
  
end