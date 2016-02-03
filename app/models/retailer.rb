class Retailer < User
  has_many :stations
  has_many :retailer_suppliers
  has_many :suppliers,through: :retailer_supplier
end
