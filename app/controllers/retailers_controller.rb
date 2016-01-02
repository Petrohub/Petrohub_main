class RetailersController < ApplicationController
  before_action :authenticate_retailer!

  def dashboard
    @retailer = current_user
  end

end
