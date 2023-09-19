Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :mechanics, only: [:show, :update] do
    post 'create_ride', to: 'mechanics_ride#create', as: :create_ride
  end

  resources :amusement_parks, only: [:show]
end
