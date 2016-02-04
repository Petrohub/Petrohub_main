class RetailerSuppliersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_retailer, only: [:create, :index]



  def index
    @connection = @retailer.retailer_suppliers.all
  end

  def new
    @connection = RetailerSupplier.new
  end

  def create
    @connection = RetailerSupplier.new(secure_params)
    @supplier = Supplier.find_by(params[:account_number])
    @connection.supplier = @supplier
    if @connection.save
      redirect_to @connection, notice: "Connection request has been sent to the #{@supplier.first_name} and waiting for their approval" if current_user.retailer?
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def pending
    @connection = @retailer.retailer_suppliers.all.where(approval: 0)
  end

  private

  def secure_params
    params.require(:retailer_supplier).permit(:retailer_id, :supplier_id, :account_number, :message, :approval)
  end


  def set_supplier
  end

  def set_retailer
    @retailer = current_user if current_user.retailer?
  end
end
