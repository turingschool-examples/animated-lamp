Rails.application.routes.draw do
  get '/mechanics/:mechanic_id', to: 'mechanics#show'
  post '/mechanics/:mechanic_id/rides', to: 'ride_mechanics#create'

  get '/amusementparks/:amusement_park_id', to: 'amusement_parks#show'
end
