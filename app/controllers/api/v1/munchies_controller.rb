class Api::V1::MunchiesController < ApplicationController
  def index
    travel_time = LocationFacade.get_travel_time(params[:from], params[:to])

  end
end
