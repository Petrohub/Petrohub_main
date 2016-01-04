json.array!(@stations) do |station|
  json.extract! station, :id, :brand, :business_name, :tax_id, :phone_number, :contact_person, :cell_number, :address1, :address2, :city, :state, :zip, :station_reg_number, :retailer_id
  json.url station_url(station, format: :json)
end
