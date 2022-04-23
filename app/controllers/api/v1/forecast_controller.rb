class Api::V1::ForecastController < ApplicationController
  def index
    location = LocationFacade.get_location(params[:location])
    forecast = OpenWeatherFacade.get_weather(location.latitude, location.longitude)
    # require "pry"; binding.pry
  end
end
