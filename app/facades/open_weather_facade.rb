class OpenWeatherFacade
  def self.get_weather(latitude, longitude)
    weather_data = OpenWeatherService.find_weather(latitude, longitude)
    ForecastPoro.new(weather_data)
  end

  def self.get_future_weather(travel_time, destination_coords)
    round_up = 0
    hours = travel_time.split(':')[0].to_i
    minutes = travel_time.split(':')[1].to_i
    if minutes > 30
      round_up = 1
    else
      round_up = 0
    end
    number_of_hours = (hours + round_up) - 1
    weather_data = OpenWeatherService.find_weather(destination_coords.latitude, destination_coords.longitude)
    data = ForecastPoro.new(weather_data)
    data.all_weather_hours[number_of_hours]
  end
end
