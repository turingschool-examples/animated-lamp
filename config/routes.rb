Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/mechanics/:mechanic_id", to: "mechanics#show" 
  post "/mechanics/:mechanic_id", to: "mechanics#create" 

  get "/amusement_parks/:amusement_park_id", to: "amusement_parks#show" 
end
