Rails.application.routes.draw do
  root "events#index"  
  
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :events
  resources :locations
  resources :events_guests, only: [:create, :destroy]
    
  get 'login', to: "events#index"
  post 'login', to: "sessions#create"
  delete  'logout', to: "sessions#destroy"
  
  
end
