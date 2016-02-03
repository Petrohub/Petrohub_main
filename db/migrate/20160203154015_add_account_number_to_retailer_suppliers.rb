class AddAccountNumberToRetailerSuppliers < ActiveRecord::Migration
  def change
    add_column :retailer_suppliers, :account_number, :string
    add_column :retailer_suppliers, :message, :text
  end
end
