class OpenWeatherService

  def self.find_weather(latitude, longitude)
    response = conn.get("onecall") do |require|
      require.params['lat'] = latitude
      require.params['lon'] = longitude
      require.params['units'] = "imperial"
      require.params['exclude'] = "minutely"
    end
    parse_json(response)
  end

private
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/") do |require|
      require.params['appid'] = ENV['open_weather_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
