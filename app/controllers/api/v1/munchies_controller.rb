class Api::V1::MunchiesController < ApplicationController
  def index
    if params[:start] && params[:destination] && params[:food]
      travel_time = LocationFacade.get_travel_time(params[:start], params[:destination])
      restaurant = YelpFacade.get_restaurant(params[:food], params[:destination]).first
      destination = LocationFacade.get_location(params[:destination])
      forecast = OpenWeatherFacade.get_weather(destination.latitude, destination.longitude)
      render json: MunchiesSerializer.new(params[:destination], forecast, travel_time, restaurant), status: :ok
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
