class Supplier < User
  def supplier?
    self.type == self.class.name
  end
end
