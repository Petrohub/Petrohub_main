class CreateRetailerSuppliers < ActiveRecord::Migration
  def change
    create_table :retailer_suppliers do |t|
      t.references :retailer, index: true, foreign_key: true
      t.references :supplier, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
