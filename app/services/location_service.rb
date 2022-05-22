class LocationService

  def self.find_location(location)
    response = conn.get("geocoding/v1/address") do |require|
      require.params['location'] = location
    end
    parse_json(response)
  end

  def self.find_travel_time(from, to)
    response = conn.get("directions/v2/route") do |require|
      require.params['from'] = from
      require.params['to'] = to
    end
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/") do |require|
      require.params['key'] = ENV['mapquest_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
