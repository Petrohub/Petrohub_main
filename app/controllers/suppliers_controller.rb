class SuppliersController < ApplicationController
  before_action do
    :authenticate_user!
    redirect_to retailer_dashboard_path if current_user.retailer?
  end
  def dashboard
  end
end
