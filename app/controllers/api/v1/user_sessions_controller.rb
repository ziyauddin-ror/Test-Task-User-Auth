class Api::V1::UserSessionsController < Api::V1::ApiController
	def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token(user.id)
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
