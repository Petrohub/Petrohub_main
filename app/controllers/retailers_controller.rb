class RetailersController < ApplicationController
  before_action do
    :authenticate_user!
    redirect_to supplier_dashboard_path if current_user.supplier?
  end
  def dashboard
    @retailer = current_user
  end
end
