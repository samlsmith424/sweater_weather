require 'rails_helper'

RSpec.describe ForecastPoro do
  it 'can return data about current weather in a location' do
    VCR.use_cassette("open weather poro") do

      weather_data = OpenWeatherService.find_weather(39.738453, -104.984853)
      data = ForecastPoro.new(weather_data)

      expect(data).to be_a(ForecastPoro)
      expect(data.current_weather).to be_a(CurrentWeather)
      expect(data.daily_weather.first).to be_a(DailyWeather)
      expect(data.hourly_weather.first).to be_a(HourlyWeather)
    end
  end
end
