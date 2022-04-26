require 'rails_helper'

RSpec.describe 'create user request' do
  it 'can create a user' do
    headers = { "Content-Type" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', :params => body.to_json , :headers => headers

    expect(response).to be_successful
    expect(response.status).to eq(201)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_a(String)

    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("users")

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_a(Hash)

    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to eq("whatever@example.com")

    expect(parsed[:data][:attributes]).to have_key(:auth_token)
    expect(parsed[:data][:attributes][:auth_token]).to be_a(String)
  end

  it 'does not create a user if password does not match password confirmation' do
    headers = { "Content-Type" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "wrong_password"
    }

    post '/api/v1/users', :params => body.to_json , :headers => headers

    expect(response).to have_http_status(:bad_request)
  end

  it 'does not create a user if email already exists' do
    user = User.create(email: "whatever@example.com", password: "password", password_confirmation: "password")
    headers = { "Content-Type" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', :params => body.to_json , :headers => headers

    expect(response).to have_http_status(:bad_request)
  end

  it 'does not create a user if a field is missing' do
    headers = { "Content-Type" => "application/json" }
    body = {
      "email": "whatever@example.com",
      "password": "password"
      # "password_confirmation": "wrong_password"
    }

    post '/api/v1/users', :params => body.to_json , :headers => headers

    expect(response).to have_http_status(:bad_request)
  end
end
