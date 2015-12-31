module ApplicationHelper

   def user_admin?
     current_user.admin?
   end

   def user_retailer?
     current_user.retailer?
   end

   def user_supplier?
     current_user.suupplier?
   end
end
