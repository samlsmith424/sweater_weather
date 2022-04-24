require 'rails_helper'

RSpec.describe 'weather endpoint' do
  it 'search for a geographic location' do
    VCR.use_cassette("Denver location and weather") do
      location = "Denver, CO"
      get "/api/v1/forecast?location=#{location}"
      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(nil)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to be_a(Hash)
      expect(parsed[:data][:attributes]).to have_key(:current_weather)

      current_weather = parsed[:data][:attributes][:current_weather]
      expect(current_weather).to have_key(:datetime)
      expect(current_weather[:datetime]).to be_a(String)

      expect(current_weather).to have_key(:sunrise)
      expect(current_weather[:sunrise]).to be_a(String)

      expect(current_weather).to have_key(:sunset)
      expect(current_weather[:sunset]).to be_a(String)

      expect(current_weather).to have_key(:temperature)
      expect(current_weather[:temperature]).to be_a(Float)

      expect(current_weather).to have_key(:feels_like)
      expect(current_weather[:feels_like]).to be_a(Float)

      expect(current_weather).to have_key(:humidity)
      expect(current_weather[:humidity]).to be_a(Integer)

      expect(current_weather).to have_key(:uvi)
      expect(current_weather[:uvi]).to be_a(Float).or be_an(Integer)

      expect(current_weather).to have_key(:visibility)
      expect(current_weather[:visibility]).to be_a(Integer)

      expect(current_weather).to have_key(:conditions)
      expect(current_weather[:conditions]).to be_a(String)

      expect(current_weather).to have_key(:icon)
      expect(current_weather[:icon]).to be_a(String)

      expect(parsed[:data][:attributes]).to have_key(:daily_weather)
      expect(parsed[:data][:attributes][:daily_weather]).to be_an(Array)
      daily_weather = parsed[:data][:attributes][:daily_weather]
      daily_weather.each do |d|
        expect(d).to have_key(:date)
        expect(d[:date]).to be_a(String)

        expect(d).to have_key(:sunrise)
        expect(d[:sunrise]).to be_a(String)

        expect(d).to have_key(:sunset)
        expect(d[:sunset]).to be_a(String)

        expect(d).to have_key(:max_temp)
        expect(d[:max_temp]).to be_a(Float)

        expect(d).to have_key(:min_temp)
        expect(d[:min_temp]).to be_a(Float)

        expect(d).to have_key(:conditions)
        expect(d[:conditions]).to be_a(String)

        expect(d).to have_key(:icon)
        expect(d[:icon]).to be_a(String)
      end

      expect(parsed[:data][:attributes]).to have_key(:hourly_weather)
      expect(parsed[:data][:attributes][:hourly_weather]).to be_an(Array)
      hourly_weather = parsed[:data][:attributes][:hourly_weather]
      hourly_weather.each do |h|
        expect(h).to have_key(:time)
        expect(h[:time]).to be_a(String)

        expect(h).to have_key(:temperature)
        expect(h[:temperature]).to be_a(Float)

        expect(h).to have_key(:conditions)
        expect(h[:conditions]).to be_a(String)

        expect(h).to have_key(:icon)
        expect(h[:icon]).to be_a(String)
      end
    end
  end
end
