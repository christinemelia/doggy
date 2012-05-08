class AdminController < ApplicationController
  
  
  # before_filter :authenticate_admin!
  def index
    @total_orders = Order.count
   
  end

end
