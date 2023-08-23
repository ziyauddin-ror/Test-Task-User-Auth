class Api::V1::UserRegistrationsController < Api::V1::ApiController
	def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User registered successfully' }, status: :created
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
