class Api::V1::MunchiesController < ApplicationController
  def index
    travel_time = LocationFacade.get_travel_time(params[:from], params[:to])
    restaurant = YelpFacade.get_restaurant(params[:food], params[:to])
  end
end
