class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true

  has_secure_password

  private
  def generate_access_token
    self.token = loop do
      random_token = SecureRandom.hex(10)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
