class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true
  # before_create :generate_access_token

  has_secure_password
  has_secure_token :auth_token

  # def generate_access_token
  #   self.auth_token = SecureRandom.hex(10)
  # end
end
