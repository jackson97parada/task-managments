class JsonWebToken
  SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 1.day.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET)[0]

    HashWithIndifferentAccess.new(body)

  rescue JWT::DecodeError => e
    raise(ExceptionHandler::InvalidToken, Message.expired_token)
  end
end

