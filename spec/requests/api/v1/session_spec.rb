require 'rails_helper'

RSpec.describe 'create session request' do
  it 'can create a session' do
    user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
    headers = { "Content-Type" => "application/json", "Accept" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    post '/api/v1/sessions', :params => body.to_json , :headers => headers

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_a(String)

    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("users")

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_a(Hash)

    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to be_a(String)

    expect(parsed[:data][:attributes]).to have_key(:auth_token)
    expect(parsed[:data][:attributes][:auth_token]).to be_a(String)
  end

  it 'can returns an error if credentials are bad' do
    user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
    headers = { "Content-Type" => "application/json", "Accept" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "wrong_password"
    }

    post '/api/v1/sessions', :params => body.to_json , :headers => headers

    expect(response).to have_http_status(:bad_request)
  end
end
