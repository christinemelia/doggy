class StoreController < ApplicationController
  skip_before_filter :authorize
  
  #before_filter :authenticate_user!
  
  def index
    @products = Product.order(:title)
    @cart = current_cart
    @locations = Location.all
  end

end

  
 