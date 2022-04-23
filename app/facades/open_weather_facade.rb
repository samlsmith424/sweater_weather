class OpenWeatherFacade
  def self.get_weather(latitude, longitude)
    weather_data = OpenWeatherService.find_weather(latitude, longitude)
    OpenWeatherPoro.new(weather_data)
  end
end
