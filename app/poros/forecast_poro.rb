class ForecastPoro
  attr_reader :current_weather,
              :daily_weather

  def initialize(weather_data)
    @current_weather = CurrentWeather.new(weather_data)
    @daily_weather = five_days_weather(weather_data)
  end

  def five_days_weather(weather_data)
    weather_data[:daily][0..4].map do |daily|
      DailyWeather.new(daily)
    end
  end
end
