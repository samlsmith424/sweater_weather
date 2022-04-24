require 'rails_helper'

RSpec.describe 'background image endpoint' do
  it 'can attain image info from a user query' do
    VCR.use_cassette("background request") do
      query = "Denver, CO"
      get "/api/v1/backgrounds?location=#{query}"

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("image")

      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to be_a(Hash)

      expect(parsed[:data][:attributes]).to have_key(:image)
      expect(parsed[:data][:attributes][:image]).to be_a(Hash)

      expect(parsed[:data][:attributes][:image]).to have_key(:location)
      expect(parsed[:data][:attributes][:image][:location]).to be_a(String)

      expect(parsed[:data][:attributes][:image]).to have_key(:image_url)
      expect(parsed[:data][:attributes][:image][:image_url]).to be_a(String)

      expect(parsed[:data][:attributes][:image]).to have_key(:credit)
      expect(parsed[:data][:attributes][:image][:credit]).to be_a(Hash)

      expect(parsed[:data][:attributes][:image][:credit]).to have_key(:source)
      expect(parsed[:data][:attributes][:image][:credit][:source]).to be_a(String)

      expect(parsed[:data][:attributes][:image][:credit]).to have_key(:author)
      expect(parsed[:data][:attributes][:image][:credit][:author]).to be_a(String)
    end
  end
end
