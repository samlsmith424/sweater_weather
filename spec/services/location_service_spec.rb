require 'rails_helper'

RSpec.describe 'location service' do
  it 'can return information about a specific location' do
    VCR.use_cassette("location service") do
      location_data = LocationService.find_location("Denver, CO")
      expect(location_data).to be_a(Hash)

      expect(location_data).to have_key(:results)
      expect(location_data[:results]).to be_an(Array)

      location_data[:results].each do |loc_data|
        expect(loc_data).to have_key(:locations)
        expect(loc_data[:locations]).to be_an(Array)

        loc_data[:locations].each do |data|
          expect(data).to have_key(:latLng)
          expect(data[:latLng]).to be_a(Hash)

          expect(data[:latLng]).to have_key(:lat)
          expect(data[:latLng][:lat]).to be_a(Float)

          expect(data[:latLng]).to have_key(:lng)
          expect(data[:latLng][:lng]).to be_a(Float)
        end
      end
    end
  end

  it 'can return information about travel from and to a destination' do
    VCR.use_cassette("service destination") do
      travel_time = LocationService.find_travel_time("denver, co", "pueblo, co")

      expect(travel_time).to be_a(Hash)
      expect(travel_time).to have_key(:route)

      expect(travel_time[:route]).to be_a(Hash)
      expect(travel_time[:route]).to have_key(:formattedTime)
      expect(travel_time[:route][:formattedTime]).to be_a(String)
    end
  end
end
