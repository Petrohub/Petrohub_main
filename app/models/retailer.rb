class Retailer < User
  def retailer?
    self.type == self.class.name
  end
end
