class OpenWeatherFacade
  def self.get_weather(latitude, longitude)
    weather_data = OpenWeatherService.find_weather(latitude, longitude)
    ForecastPoro.new(weather_data)
  end

  def self.get_future_weather(travel_time, destination_coords)
    number_of_hours = travel_time.split(':')[0].to_i
    weather_data = OpenWeatherService.find_weather(destination_coords.latitude, destination_coords.longitude)
    data = ForecastPoro.new(weather_data)
    arrival_weather = data.all_weather_hours[number_of_hours]
  end
end
