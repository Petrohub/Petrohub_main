class AdminsController < ApplicationController
  before_action do
    :authenticate_admin!
    redirect_to retailer_dashboard_path if current_user.retailer?
    redirect_to supplier_dashboard_path if current_user.supplier?
  end

  def dashboard
    @admin = current_user
    @retailers = Retailer.all
    @suppliers = Supplier.all
  end


end
