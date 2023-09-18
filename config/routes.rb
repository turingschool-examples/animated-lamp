Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :mechanics, only: [:show]
  get "/mechanics/:mechanic_id", to: "mechanics#show"

  resources :ride_mechanics, only: [:create]

  resources :amusement_parks, only: [:show]
end
