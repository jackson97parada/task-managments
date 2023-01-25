class AuthorizedApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    { user: user }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decode_auth_token[:user_id]) if decode_auth_token

    rescue ActiveRecord::RecordNotFound=> e
    raise(ExceptionHandler::InvalidToken, ("#{Message.invalid_token} #{e.message}"))
  end

  def decode_auth_token
    @decode_auth_token ||= JsonWebToken.decode(http_auth_headers)
  end

  def http_auth_headers
    if headers[:Authorization].present?
      return headers[:Authorization].split(' ').last
    end
    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
