class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'.freeze
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(id)
    payload = { user_id: id }
    JWT.encode(payload, HMAC_SECRET, ALGORITHM_TYPE)
  end

  def self.decode(token)
    decoded = JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE })
    HashWithIndifferentAccess.new decoded[0]
  end
end
