class ProgressController < ApplicationController
  before_action :authenticate_user!

  # GET /progress_entries
  def index
    progress_entries = current_user.progress_entries.order(:day)
    render json: progress_entries, status: :ok
  end

  # POST /progress_entries
  def create
    if params[:progress_entries].is_a?(Array)
      created_entries = []
      errors = []

      multiple_progress_entries_params.each do |entry_params|
        progress_entry = current_user.progress_entries.build(entry_params)

        if progress_entry.save
          created_entries << progress_entry
        else
          errors << {entry: entry_params, error: progress_entry.errors.full_messages }
        end
      end

      if errors.empty?
        render json: created_entries, status: :created
      else
        render json: { error: errors}, status: :unprocessable_entity
      end

    else
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

  def multiple_progress_entiers_params
    params.require(:progress_entries).map do |entry|
      entry.permit(:image_id, :day, :region_id, :color)
    end
  end
end
