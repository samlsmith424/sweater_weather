class ForecastPoro
  attr_reader :current_weather

  def initialize(weather_data)
    @current_weather = CurrentWeather.new(weather_data)

# require "pry"; binding.pry
  end
end
