class Retailer < User
  has_many :stations
  has_many :retailer_supplier
  has_many :suppliers,through: :retailer_supplier
end
