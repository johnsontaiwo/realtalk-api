require 'jwt'

class Auth
  ALGORITHM = 'HS256'
  

  def self.encrypt(payload)
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def self.decode(token)
    begin
    JWT.decode(token, secret_key, true, { algorithm: ALGORITHM }).first
    rescue JWT::DecodeError
      nil
    end
  end

  def self.secret_key
  '7cb766ed5e9a3b34bad2f55c326f4b4f915e93fd6b4e060ec93e9291f0bef46f694fdbe8df9f9394e040c97f5da86699de66b4e4f4c9f62c32469c5d78d2e9e5'
  end
 end