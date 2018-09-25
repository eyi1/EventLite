Rails.application.routes.draw do
  
  root "static_pages#home" 
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "sessions#create"
  
  resources :users do 
    resources :events
  end

  resources :attendances
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
