class ProgressController < ApplicationController
  before_action :authenticate_user!

  # GET /progress_entries
  def index
    progress_entries = current_user.progress_entries.order(:day)
    render json: progress_entries, status: :ok
  end

  # POST /progress_entries
  def create
    progress_entry = current_user.progress_entries.build(progress_entry_params) 
    if progress_entry.save
      render json: progress_entry, status: :created
    else
      render json: { errors: progress_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def progress_entry_params
    params.require(:progress_entry).permit(:image_id, :day, :region_id, :color)
  end
end
