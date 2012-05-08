class StoreController < ApplicationController
  #ßskip_before_filter :authorize
  
  
 # before_filter :authenticate_user!
  
  #load_and_authorize_resource
  
  
  def index
    @products = Product.order(:title)
    @cart = current_cart
    @locations = Location.all
  end
end 


  
 