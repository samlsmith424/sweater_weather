require 'rails_helper'

RSpec.describe LocationPoro do
  it 'can give the latitude and longitude of a location' do
    geo = {
      lat: 39.738453,
      lng: -104.984853
    }
    
    data = LocationPoro.new(geo)

    expect(data).to be_a(LocationPoro)
    expect(data.latitude).to eq(39.738453)
    expect(data.longitude).to eq(-104.984853)
  end
end
