Rails.application.routes.draw do
  # # create new user account
  # post '/users', to: 'users#create'

  # # show users
  # get '/users', to: 'users#index'

  # # login and generate auth token
  # post '/sessions', to: 'sessions#create'

  # # fetch authenticated user's progress entries
  # get '/progress_entries', to: 'progress#index'

  # # create progress entry for user
  # post '/progress_entries', to: 'progress#create'

  # # fetch information for single image
  # get '/images/:id', to: 'images#show'

  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]

  resources :commitments, only: [:index, :create, :show, :update, :destroy] do
    # HTTP Method: GET /commitments/:commitment_id/progress_entries
    # HTTP Method: POST /commitments/:commitment_id/progress_entries
    resources :progress_entries, only: [:index, :create]
  end

  resources :images, only: [:show]
end
