class AdminsController < ApplicationController
  before_action :authenticate_admin!


  def dashboard
  end

  def suppliers
    @suppliers = Supplier.all
  end

  def retailers
    @retailers = Retailer.all
  end




end
