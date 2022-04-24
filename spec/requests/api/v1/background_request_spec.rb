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
    end
  end
end
