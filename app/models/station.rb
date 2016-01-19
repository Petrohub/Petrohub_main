class Station < ActiveRecord::Base
  belongs_to :user
  has_many :tanks
end
