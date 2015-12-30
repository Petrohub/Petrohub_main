class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

   def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number,:cell_number, :tax_id, :business_name, :address1, :address2,:city, :state, :zip_code, :years_in_business, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number,:cell_number, :tax_id, :business_name, :address1, :address2,:city, :state, :zip_code, :years_in_business, :email, :password, :password_confirmation) }
   end
end
