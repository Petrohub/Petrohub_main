class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :brand
      t.string :business_name
      t.string :tax_id
      t.string :phone_number
      t.string :contact_person
      t.string :cell_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :station_reg_number
      t.references :retailer, index: true
      t.integer :retailer_id




      t.timestamps null: false
    end
  end
end
