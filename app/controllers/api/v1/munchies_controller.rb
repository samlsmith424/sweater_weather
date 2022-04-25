class Api::V1::MunchiesController < ApplicationController
  def index
    travel_time = LocationFacade.get_travel_time(params[:start], params[:destination])
    restaurant = YelpFacade.get_restaurant(params[:food], params[:destination]).first
    # destination = LocationFacade.get_location(params[:to])
    # forecast = OpenWeatherFacade.get_weather(destination.latitude, location.longitude)
    render json: MunchiesSerializer.new(params[:destination], forecast, travel_time, restaurant)
  end
end
