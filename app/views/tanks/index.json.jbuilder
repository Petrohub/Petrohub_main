json.array!(@tanks) do |tank|
  json.extract! tank, :id, :type_of_fuel, :size, :registration_id, :station_id
  json.url tank_url(tank, format: :json)
end
