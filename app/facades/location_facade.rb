class LocationFacade
  def self.get_location(location)
    location = LocationService.find_location(location)
    LocationPoro.new(location[:results].first[:locations].first[:latLng])
  end
end
