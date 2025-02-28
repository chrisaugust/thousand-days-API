Rails.application.routes.draw do
  # create new user account
  post '/users', to: 'users#create'

  # login and generate auth token
  post '/sessions', to: 'sessions#create'

  # fetch authenticated user's progress entries
  get '/progress_entries', to: 'progress#index'

  # create progress entry for user
  post '/progress_entries', to: 'progress#create'

  # fetch information for single image
  get '/images/:id', to: 'images#show'
end
