require 'rails_helper'

RSpec.describe 'location service' do
  it 'can connect to a location service' do
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
end
