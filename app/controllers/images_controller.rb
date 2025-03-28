class ImagesController < ApplicationController
  require 'csv'

  def show
    image = Image.find(params[:id])
    render json: image, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Image not found' }, status: :not_found
  end

  def region_color_mapping
    image = Image.find(params[:id])
    csv_path = Rails.root.join('public', 'images', "#{image.name}.csv")
    
    unless File.exist?(csv_path)
      render json: {error: "CSV file not found"}, status: :not_found and return
    end

    mapping = {} 
    CSV.foreach(csv_path, headers: true) do |row|
      region_id = row[0]
      hex_code = row[4]
      mapping[region_id] = hex_code
    end

    render json: mapping
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Image not found' }, status: :not_found
  end
end
