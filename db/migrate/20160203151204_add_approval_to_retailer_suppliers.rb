class AddApprovalToRetailerSuppliers < ActiveRecord::Migration
  def change
    add_column :retailer_suppliers, :approval, :integer,  default: 0
  end
end
