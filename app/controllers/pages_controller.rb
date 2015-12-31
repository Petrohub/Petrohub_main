class PagesController < ApplicationController
  def home
    if signed_in?
      if current_user.retailer?
        redirect_to retailer_dashboard_path
      elsif current_user.admin?
        redirect_to admin_dashboard_path
      elsif current_user.supplier?
        redirect_to supplier_dashboard_path
     end
   end
  end

  def about
  end

  def contact
  end
end
