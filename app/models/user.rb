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
    type == 'Admin'
  end

  def supplier?
    type == 'Supplier'
  end

  def retailer?
    type == 'Retailer'
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  private

  # this method generates and assigns random account number to the users
  def generate_account_number
    rand_num = SecureRandom.hex(3).upcase
    self.account_number = if admin?
                            'EGYPT' + '-' + rand_num
                          elsif retailer?
                            'NJ' + '-' + rand_num + '-' + 'RET'
                          elsif supplier?
                            'NJ' + '-' + rand_num + '-' + 'SUP'
                          else
                            0
    end
  end
end
