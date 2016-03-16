class MainController < ApplicationController
  def index
  end

  def show
    api = Wunderground.new
    @forecast = api.forecast_for(params[:zip_code])
  end
end
