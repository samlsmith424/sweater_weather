class API::V1::WeatherController < ApplicationController
  def index
    @location = LocationFacade.get_location(location)
  end
end
