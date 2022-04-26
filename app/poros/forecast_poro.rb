class ForecastPoro
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather,
              :all_weather_hours

  def initialize(weather_data)
    @current_weather = CurrentWeather.new(weather_data)
    @daily_weather = five_days_weather(weather_data)
    @hourly_weather = eight_hours_weather(weather_data)
    @all_weather_hours = all_hours_weather(weather_data)
  end

  def five_days_weather(weather_data)
    weather_data[:daily][0..4].map do |daily|
      DailyWeather.new(daily)
    end
  end

  def eight_hours_weather(weather_data)
    weather_data[:hourly][0..7].map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end

  def all_hours_weather(weather_data)
    weather_data[:hourly].map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end
end
