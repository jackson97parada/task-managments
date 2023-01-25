class Message
  def self.invalid_credentials
    'Email or password incorrect'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.expired_token
    'Sorry your token has expired'
  end
end
