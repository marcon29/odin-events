Rails.application.routes.draw do
  
  resources :locations
  root "events#index"
  resources :events
  
end
