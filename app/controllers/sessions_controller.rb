class SessionsController < ApplicationController
  # POST /sessions
  def create
    # authenticate based on email and password
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # create an auth token
      token = JwtService.encode(user_id: user.id)
      render json: { token: token, user_id: user.id }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
