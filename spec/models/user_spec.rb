require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'instance methods' do
    it '#generate_access_token' do
      user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password")
      expect(user.generate_access_token).to be_a(String)
    end
  end
end
