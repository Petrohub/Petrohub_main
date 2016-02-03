class RetailerSupplier < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :supplier

  enum approval: [:pending, :accept, :decline]

  def approved?
    self.accept?
  end

  def declined?
    self.decline?
  end





end
