class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @products = Product.order(:title)
    @cart = current_cart
    @locations = Location.all
  end

end

  
 