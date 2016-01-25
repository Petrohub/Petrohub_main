class RetailersController < ApplicationController
  before_action :authenticate_user!


  def dashboard
    @retailer = current_user
  end

  def my_stations
    @stations = current_user.stations.all
  end

  def inactive_stations
  end

  def transfers
  end

end
