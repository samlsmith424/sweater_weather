require 'rails_helper'

RSpec.describe 'open weather service' do
  it 'returns weather data based on a latitude and longitude' do
    VCR.use_cassette("open weather service") do
      response = OpenWeatherService.find_weather(39.738453, -104.984853)

      expect(response).to be_a(Hash)
    end
  end
end
