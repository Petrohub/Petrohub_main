class RetailerSupplier < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :supplier

  enum approval: [:pending, :accept, :decline]

  def approved?
    accept?
  end

  def declined?
    decline?
  end
end
