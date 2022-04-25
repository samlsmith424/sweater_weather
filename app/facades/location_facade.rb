class LocationFacade
  def self.get_location(location)
    location = LocationService.find_location(location)
    LocationPoro.new(location[:results].first[:locations].first[:latLng])
  end

  def self.get_travel_time(from, to)
    travel_time = LocationService.find_travel_time(from, to)
    travel_time[:route][:formattedTime]
  end
end
