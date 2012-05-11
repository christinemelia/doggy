#written by christine melia 03247376 refernce :

class AdminController < ApplicationController
 before_filter :authenticate_user!
  
  #load_and_authorize_resource
   
   #before_filter :authenticate_admin!
  def index
    @total_orders = Order.count
   
  end
  
else 
  redirect_to store_url
end


end 
