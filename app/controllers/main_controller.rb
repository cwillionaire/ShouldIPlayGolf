class MainController < ApplicationController
  respond_to :js

  def index
  end

  def show
    @forecast = Wunderground::Resources.forecast(lat: params[:locationLat], long: params[:locationLong])
  end
end
