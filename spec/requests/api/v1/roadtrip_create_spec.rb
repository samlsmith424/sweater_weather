require 'rails_helper'

RSpec.describe 'create road_trip request' do
  it 'can create a roadtrip' do
    VCR.use_cassette("road_trip request") do

      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

      headers = { "Content-Type" => "application/json", "Accept" => "application/json" }
      body = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": user.auth_token
      }

      post '/api/v1/road_trip', :params => body.to_json , :headers => headers

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)

      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(nil)

      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("roadtrip")

      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to be_a(Hash)

      expect(parsed[:data][:attributes]).to have_key(:start_city)
      expect(parsed[:data][:attributes][:start_city]).to eq("Denver,CO")

      expect(parsed[:data][:attributes]).to have_key(:end_city)
      expect(parsed[:data][:attributes][:end_city]).to eq("Pueblo,CO")

      expect(parsed[:data][:attributes]).to have_key(:travel_time)
      expect(parsed[:data][:attributes][:travel_time]).to be_a(String)

      expect(parsed[:data][:attributes]).to have_key(:weather_at_eta)
      expect(parsed[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(parsed[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(parsed[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_an(Integer)

      expect(parsed[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(parsed[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
end
