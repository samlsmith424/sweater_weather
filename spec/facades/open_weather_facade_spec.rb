require 'rails_helper'

RSpec.describe 'open weather facade' do
  it 'can return weather data from latitude and longitude' do
    VCR.use_cassette("open weather facade") do
      weather_info = OpenWeatherFacade.get_weather(39.738453, -104.984853)

      expect(weather_info).to be_an(OpenWeatherPoro)
    end
  end
end
