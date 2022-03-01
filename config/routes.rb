Rails.application.routes.draw do
  root "events#index"  
  
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :events
  resources :locations
    
  get 'login', to: "events#index"
  post 'login', to: "sessions#create"
  delete  'logout', to: "sessions#destroy"
end
