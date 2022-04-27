class Api::V1::RoadTripController < ApplicationController
  def create
    travel_time = LocationFacade.get_travel_time(params[:origin], params[:destination])
    if travel_time
      destination_coords = LocationFacade.get_location(params[:destination])
      arrival_weather = OpenWeatherFacade.get_future_weather(travel_time, destination_coords)
      render json: RoadTripSerializer.trip_info(travel_time, params[:origin], params[:destination], arrival_weather), status: :ok
    else
      render json: RoadTripSerializer.no_route(travel_time, params[:origin], params[:destination], arrival_weather), status: :ok
    end
  end
end
