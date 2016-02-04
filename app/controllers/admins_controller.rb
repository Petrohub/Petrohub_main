class AdminsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  end

  def suppliers
    @suppliers = Supplier.all
  end

  def retailers
    @retailers = Retailer.all
  end
end
