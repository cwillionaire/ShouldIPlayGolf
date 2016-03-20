class MainController < ApplicationController
  def index
  end

  def show
    @forecast = Wunderground::Resources.forecast(zip: params[:zip_code])
  end
end
