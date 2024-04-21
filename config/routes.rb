Rails.application.routes.draw do
  # User signup route (POST request)
  post '/users', to: 'users#create'

  # User login route (POST request)
  post '/login', to: 'users#login'
end
