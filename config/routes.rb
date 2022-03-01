Rails.application.routes.draw do
  
  
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :locations
  root "events#index"
  resources :events
  
end
