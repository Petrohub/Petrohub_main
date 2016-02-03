class Supplier < User
  has_many :retailer_suppliers
  has_many :retailers, through: :retailer_suppliers
end
