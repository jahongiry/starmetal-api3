module JwtToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def issue_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def decode_token(token)
    JWT.decode(token, SECRET_KEY)[0]
  end

  def current_user
    @current_user ||= User.find_by(id: decode_token(auth_header)['user_id'])
  end

  private

  def auth_header
    request.headers['Authorization']
  end
end
