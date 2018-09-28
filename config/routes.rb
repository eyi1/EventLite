Rails.application.routes.draw do
  
  root "static_pages#home" 
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "sessions#create"
  post "/attendances/new", to: "attendances#new"

  resources :users do 
    resources :events, only: [:index, :new, :show, :create, :edit, :update]
  end

  resources :events do
    resources :users
  end

  resources :users
  resources :events
  #resources :attendances, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
