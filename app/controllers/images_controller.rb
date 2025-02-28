class ImagesController < ApplicationController
  def show
    image = Image.find(params[:id])
    render json: image, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Image not found' }, status: :not_found
  end
end
