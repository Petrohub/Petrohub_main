class AddRetailerSupplierIdToRetailer < ActiveRecord::Migration
  def change
    add_column :users, :retailer_supplier_id, :integer
  end
end
