class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  # ...
  validates :name, :address, :email, :pay_type, :grooming_date, :grooming_time, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  has_many :line_items, :dependent => :destroy
  # ...
  # ...
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end







# class Order < ActiveRecord::Base
#   has_many :transactions, :class_name => "PaymentTransaction"
  
  
  
 
  
  
 #  def purchase
      # response = process_purchase
      # transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
     #  cart.update_attribute(:purchased_at, Time.now) if response.success?
   #    response.success?
  #   end

 #    def price_in_cents
 #      (cart.total_price*100).round
  #   end
  
  
  
  
  

#   def process_purchase
 #  EXPRESS_GATEWAY.purchase(amount, express_purchase_options)
  # end

  # def express_purchase_options
 #  {
 #  :ip => ip_address,
 #  :token => express_token,
 #  :payer_id => express_payer_id
 #  }
 #  end
  
  
  
  
 # def express
 # response = EXPRESS_GATEWAY.setup_purchase(amount,
 # :ip => request.remote_ip,
 # :return_url => new_order_url,
#  :cancel_return_url => products_url
#  )
#  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
 # end

 # def new
 # @order = Order.new(:express_token => params[:token])
 # end

 # def create

 # @order = Order.new(params[:order])
  # @order.ip_address = request.remote_ip
 # if @order.save
  #if @order.purchase
  #render :text => "success"
 # else
 # render :text => "failure"
 # end
 # else
 # render :text => 'purchase'
 # end

 # end
#end
  
  
  
  


  
  
  
  
   
   
  
