class MainController < ApplicationController
  def index
  end

  def show
    @forecast = Wunderground::Resources.forecast(lat: params[:locationLat], long: params[:locationLong])
    respond_to do |format|
      format.js
    end
  end
end
