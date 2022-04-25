require 'rails_helper'

RSpec.describe 'munchies request' do
  it 'can retrieve food and forecast info for a destination city' do
    VCR.use_cassette("munchies request") do
      info = {
        start:  "denver, co",
        destination:  "pueblo, co",
        food:  "cheese"
      }

      get "/api/v1/munchies", params: info

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data]).to have_key(:id)
      expect(body[:data][:id]).to eq("null")

      expect(body[:data]).to have_key(:type)
      expect(body[:data][:type]).to eq("munchie")

      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes]).to be_a(Hash)

      expect(body[:data][:attributes]).to have_key(:destination_city)
      expect(body[:data][:attributes][:destination_city]).to be_a(String)

      expect(body[:data][:attributes]).to have_key(:travel_time)
      expect(body[:data][:attributes][:travel_time]).to be_a(String)

      expect(body[:data][:attributes]).to have_key(:forecast)
      expect(body[:data][:attributes][:forecast]).to be_a(Hash)

      expect(body[:data][:attributes][:forecast]).to have_key(:summary)
      expect(body[:data][:attributes][:forecast][:summary]).to be_a(String)

      expect(body[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(body[:data][:attributes][:forecast][:temperature]).to be_a(Float)

      expect(body[:data][:attributes]).to have_key(:restaurant)
      expect(body[:data][:attributes][:restaurant]).to be_a(Hash)

      expect(body[:data][:attributes][:restaurant]).to have_key(:name)
      expect(body[:data][:attributes][:restaurant][:name]).to be_a(String)

      expect(body[:data][:attributes][:restaurant]).to have_key(:address)
      expect(body[:data][:attributes][:restaurant][:address]).to be_a(String)
    end
  end
end
