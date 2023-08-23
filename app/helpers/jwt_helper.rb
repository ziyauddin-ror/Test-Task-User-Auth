module JwtHelper
  def encode_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decoded_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
  end
end
