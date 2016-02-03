class Supplier < User
  has_many :retailer_supplier
  has_many :retailers,through: :retailer_supplier
end
