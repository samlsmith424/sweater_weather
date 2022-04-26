class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location] == ""
      render json: { error: "bad request" }, status: :bad_request
    elsif params[:location]
      location = LocationFacade.get_location(params[:location])
      forecast = OpenWeatherFacade.get_weather(location.latitude, location.longitude)
      render json: WeatherSerializer.new(forecast), status: :ok
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
