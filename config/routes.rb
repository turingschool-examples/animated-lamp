Rails.application.routes.draw do
  get '/mechanics/:mechanic_id', to: 'mechanics#show'
end
