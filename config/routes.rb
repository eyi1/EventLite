Rails.application.routes.draw do
  
  root "static_pages#home" 
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "events/:id/map", to: "events#location", as: :map

  get "/auth/facebook/callback", to: "sessions#create"
  post "/attendances/new", to: "attendances#new"
 
  get "events/:id/event_data", to: "events#event_data"
  get "users/:id/user_data", to: "users#user_data"
  
  get "events/:id/next", to: "events#next"

  resources :users do 
    resources :events, only: [:index, :new]
  end

  resources :events do 
    resources :comments, only: [:index, :new, :show]
  end

  resources :users
  resources :events
  resources :comments


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end