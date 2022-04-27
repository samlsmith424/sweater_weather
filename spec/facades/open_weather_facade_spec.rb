require 'rails_helper'

RSpec.describe 'open weather facade' do
  it 'can return weather data from latitude and longitude' do
    VCR.use_cassette("open weather facade") do
      weather_info = OpenWeatherFacade.get_weather(39.738453, -104.984853)

      expect(weather_info).to be_an(ForecastPoro)
    end
  end

  # it 'can return future weather data from latitude and longitude' do
  #   VCR.use_cassette("open weather facade") do
  #     travel_time = "1:00:00"
  #     destination_coords = OpenWeatherService.find_weather(39.738453, -104.984853)
  #     weather_info = OpenWeatherFacade.get_future_weather(travel_time, destination_coords)
  #
  #     expect(weather_info).to be_an(ForecastPoro)
  #   end
  # end
end
