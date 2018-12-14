Rails.application.routes.draw do
  
  root "static_pages#home" 
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "sessions#create"
  post "/attendances/new", to: "attendances#new"
 
  get "events/:id/event_data", to: "events#event_data"
  get "users/:id/user_data", to: "users#user_data"
  
  get "events/:id/next", to: "events#next"
  # get "events/events_data", to: "events#events_data"
  # get "users/users_data", to: "users#users_data"

  resources :users do 
    resources :events, only: [:index, :new]
  end

  resources :users
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
