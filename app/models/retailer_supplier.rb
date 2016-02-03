class RetailerSupplier < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :supplier
end
