require 'rails_helper'

RSpec.describe 'create user request' do
  it 'can create a user' do
    headers = { "Content-Type" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post "/api/v1/users", :params => body, :headers => headers

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end
