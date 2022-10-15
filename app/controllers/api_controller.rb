class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = AuthenticationTokenService.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def record_not_found(err)
    render json: { errors: err.message }, status: :not_found
  end
end
