require 'rails_helper'

RSpec.describe 'yelp restaurant service' do
  it 'can attain restaurant info by food and location query' do
    VCR.use_cassette("yelp service") do
      restaurant = YelpService.find_restaurant("cheese", "pueblo, co")

      expect(restaurant).to be_a(Hash)
      expect(restaurant).to have_key(:businesses)
      expect(restaurant[:businesses]).to be_an(Array)
      expect(restaurant[:businesses][0]).to have_key(:name)
      expect(restaurant[:businesses][0][:name]).to be_a(String)
      expect(restaurant[:businesses][0][:location]).to be_a(Hash)
      expect(restaurant[:businesses][0][:location][:display_address].join).to be_a(String)
      expect(restaurant[:businesses][0][:categories][0][:alias]).to be_a(String)
    end
  end
end
