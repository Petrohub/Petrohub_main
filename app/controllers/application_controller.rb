class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def after_sign_in_path_for(resource)
  if resource.retailer?
    retailer_dashboard_path
  elsif resource.supplier?
    supplier_dashboard_path
  elsif resource.admin?
    admin_dashboard_path
  else
    super
  end
end

  protected

   def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :account_number,:phone_number,:cell_number, :tax_id, :business_name, :address1, :address2,:city, :state, :zip_code, :years_in_business, :email, :password, :password_confirmation, :approved) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number,:cell_number, :tax_id,:business_name, :address1, :address2, :years_in_business, :email, :password, :password_confirmation, :approved) }
   end
end
