class User < ActiveRecord::Base
  before_validation :generate_account_number
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role?
    self.class.name.downcase.to_sym
  end

  def admin?
    self.type == "Admin"
  end
  def supplier?
    self.type == "Supplier"
  end
  def retailer?
    self.type == "Retailer"
  end

  

private
#this method generates and assigns random account number to the users
  def generate_account_number
    rand_num = rand(6**6).to_s + rand(10).to_s
    if self.admin?
      self.account_number = "EGYPT" + rand_num
    elsif self.retailer?
      self.account_number = "NJRET" + rand_num
    elsif self.supplier?
      self.account_number = "NJSUP" + rand_num
    else
      self.account_number = 0
    end
  end


end
