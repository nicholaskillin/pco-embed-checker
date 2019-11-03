Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get 'sessions/new'
  get 'login', to: redirect('/auth/planning_center'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  post '/login',   to: 'sessions#create'

  resources :embeds, except: [:create]
  namespace :api do 
    namespace :v1 do 
     resources :embeds, only: [:create]
    end 
  end 
end
