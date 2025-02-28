class ApplicationController < ActionController::API
  def authenticate_user!
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    if token.present?
      decoded = JwtService.decode(token)
      if decoded && decoded[:user_id]
        @current_user = User.find_by(id: decoded[:user_id])
      else
        render json: { error: 'Invalid or expired token' }, status: :unauthorized
      end
    else
      render json: { error: 'Missing token' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
