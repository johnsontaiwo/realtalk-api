class User < ApplicationRecord
  has_many :articles
  has_many :comments
  #alias_method :authenticate
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  #has_secure_password
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :jwt_authenticatable,
         # jwt_revocation_strategy: JWTBlacklist

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
end
