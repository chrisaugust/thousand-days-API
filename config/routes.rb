Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]

  resources :commitments, only: [:index, :create, :show, :update, :destroy] do
    # GET /commitments/:commitment_id/progress_entries
    # POST /commitments/:commitment_id/progress_entries
    resources :progress_entries, only: [:index, :create]
  end

  resources :images, only: [:show] do
    # GET /images/:id/region_color_mapping
    member do
      get 'region_color_mapping'
    end
  end
end
