class LocationService

  def self.find_location(location)
    response = conn.get("address") do |require|
      require.params['location'] = location
    end
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/") do |require|
      require.params['key'] = ENV['mapquest_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
