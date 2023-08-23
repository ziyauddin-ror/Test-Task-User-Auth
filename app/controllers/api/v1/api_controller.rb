class Api::V1::ApiController < ActionController::API
  include JwtHelper
  before_action :set_current_user

  def set_current_user
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      decoded_token = decoded_token(token)
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
  end

  def current_user
    @current_user
  end
end
