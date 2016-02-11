# STL: http://edgeguides.rubyonrails.org/association_basics.html#single-table-inheritance
# many to many http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association                                            


class User
end

class Supplier < User
  has_many :retailers_suppliers
  has_many :retailers, through:


  def update_retailers
    self.retailers.each do |retailer|
      retailer.retailer_products.each do |rp|
        rp.price = rp.product.base_price + rp.margin
       end
     end
  end                                                                                                                                                                                                    
end

class Product
  belongs_to :supplier
end
# products(price, name, description)



a table to link suppliers and retailer

class RetailersSupplier
  belongs_to :retailer
  belongs_to :supplier
end

class RetailerProduct
  belongs_to :retailer
  belongs_to :product

  margin attribute
end


Retailer Joins a supplier
  in database point of view I need to add an entry to retailers_suppliers table
    then I need to add all the current products to for the supplier in  RetailerProduct

In the future, when the admin adds a new product, I need to add the new product to all retailers

# retailers_suppliers(retailer_id, supplier_id)
# if you don't know the formula, add an text attribute to Retailer


Supplier1
  Product1 -> price is 5

Retailer1, that is paired with Supplier1, and has access to Procduct1
 price will be base price + 1% -> (Procduct1.price * 1.01)

 Product1.price + 100 / (100.03) + 1%

     "$price * 1.01"
     "$base_price * 100 / (100.03) + 1%"



class Retailer < User
end

class Admin < User
end





# how to use


current_user.base_price = 5
# s = Supplier.find(....)
current_user.base_price = 5
current_user.save
current_user.update_retailers
