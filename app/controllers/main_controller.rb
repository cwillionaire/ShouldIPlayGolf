class MainController < ApplicationController
  def index
  end

  def show
    @forecast = Wunderground::Resources.forecast(zip: params[:zip_code])
    respond_to do |format|
      format.js
    end
  end
end
