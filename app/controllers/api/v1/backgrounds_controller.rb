class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.get_background(params[:location])
    render json: BackgroundSerializer.new(background), status: :ok
  end
end
