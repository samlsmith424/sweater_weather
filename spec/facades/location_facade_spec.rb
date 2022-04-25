require 'rails_helper'

RSpec.describe 'location facade' do
  it 'can get location information' do
    VCR.use_cassette("location facade") do
      location_info = LocationFacade.get_location("Denver, CO")

      expect(location_info).to be_a(LocationPoro)
      expect(location_info.latitude).to be_a(Float)
      expect(location_info.latitude).to eq(39.738453)
      expect(location_info.longitude).to be_a(Float)
      expect(location_info.longitude).to eq(-104.984853)
    end
  end

  it 'can get location information' do
    VCR.use_cassette("travel time facade") do
      travel_time = LocationFacade.get_travel_time("denver, co", "pueblo, co")

      expect(travel_time).to be_a(String)
    end
  end
end
