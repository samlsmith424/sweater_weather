class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true

  has_secure_password
  has_secure_token :auth_token
end
