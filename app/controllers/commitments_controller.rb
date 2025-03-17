class CommitmentsController < ApplicationController
  # ensure the user is authenticated before any action
  before_action :authenticate_user!

  # load the commitment for show, update, and destroy actions
  before_action :set_commitment, only: [:show, :update, :destroy]

  def index
    @commitments = current_user.commitments
    render json: @commitments, include: :progress_entries, status: :ok
  end

  def show
    if @commitment.user == current_user
      render json: @commitment, include: :progress_entries, status: :ok
    else
      render json: { error: "Not authorized to view this commitment" }, status: :unauthorized
    end
  end

  def create
    @commitment = current_user.commitments.new(commitment_params)
    if @commitment.save
      render json: @commitment, status: :created
    else
      render json: { errors: @commitment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @commitment.user == current_user
      if @commitment.update(commitment_params)
        render json: @commitment, status: :ok
      else
        render json: { error: @commitment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @commitment.user == current_user
      @commitment.destroy
      head :no_content
    else
      render json: { error: "Not authorized to delete this commitment" }
    end
  end

  private

  def set_commitment
    @commitment = Commitment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Commitment not found" }, status: :not_found
  end

  def commitment_params
    params.require(:commitment).permit(:name, :description, :timeframe, :image_id)
  end
end
