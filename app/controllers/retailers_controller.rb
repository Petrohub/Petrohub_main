class RetailersController < ApplicationController
  before_action :authenticate_retailer!


  def dashboard
    @retailer = current_retailer
  end

  def my_stations
    @stations = current_retailer.stations.all
  end

end
