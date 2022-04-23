require 'rails_helper'

RSpec.describe 'open weather service' do
  it 'returns weather data based on a latitude and longitude' do
    VCR.use_cassette("open weather service") do
      response = OpenWeatherService.find_weather(39.738453, -104.984853)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:current)
      expect(response[:current]).to be_a(Hash)
      expect(response[:current]).to have_key(:dt)
      expect(response[:current]).to have_key(:sunrise)
      expect(response[:current]).to have_key(:sunset)
      expect(response[:current]).to have_key(:temp)
      expect(response[:current]).to have_key(:feels_like)
      expect(response[:current]).to have_key(:humidity)
      expect(response[:current]).to have_key(:uvi)
      expect(response[:current]).to have_key(:visibility)
      expect(response[:current]).to have_key(:weather)
      
      expect(response[:current][:weather]).to be_an(Array)
      response[:current][:weather].each do |info|
        expect(info).to have_key(:description)
        expect(info[:description]).to be_a(String)
        expect(info).to have_key(:icon)
        expect(info[:icon]).to be_a(String)
      end
      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_an(Array)

      expect(response).to have_key(:hourly)
      expect(response[:hourly]).to be_an(Array)
    end
  end
end
