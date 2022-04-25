class LocationPoro
  attr_reader :latitude,
              :longitude

  def initialize(location_data)
    @latitude = location_data[:lat]
    @longitude = location_data[:lng]
  end
end
