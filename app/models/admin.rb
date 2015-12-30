class Admin < User
  def admin?
    self.type == self.class.name
  end
end
