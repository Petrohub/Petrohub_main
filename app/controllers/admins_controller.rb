class AdminsController < ApplicationController
  before_action :authenticate_admin!


  def dashboard
    @admin = current_user
    @retailers = Retailer.all
    @suppliers = Supplier.all
  end


end
