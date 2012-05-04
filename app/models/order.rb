class Order < ActiveRecord::Base
  
  #written by christine melia , reference to ryan bates railscast 145 
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
 
  # ...associations 
  belongs_to :cart
  has_many :line_items, :dependent => :destroy
  has_many :transactions, :class_name => "OrderTransaction"
  
  #stored in memeory only for security reasons donnot write to db 
   attr_accessor :card_number, :card_verification, :card_expires_on
   
  
  #validations 
  validates :first_name,:last_name, :address, :email, :pay_type, :grooming_date, :grooming_time, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  

  # Credit Card Validation
  validate :validate_card, :on =>:create
  # CC validation method taken from Ryan Bate's Railscast #145
    # checks the CC info and adds any error messages to the order model's error messages.
    
    
    
    #part of active merchnt gems functionality 
     def credit_card
        @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
          :type               => card_type,
          :number             => card_number,
          :verification_value => card_verification,
          :month              => card_expires_on.month,
          :year               => card_expires_on.year,
          :first_name         => first_name,
          :last_name          => last_name
        )
     end

     def validate_card
       unless credit_card.valid?
         credit_card.errors.full_messages.each do |message|
            errors.add(:base, message)
         end
       end
     end
    
  
# active merchant fnctionality re written to integrate with my application 
  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :ammount => price_in_cents, :response => response)
    #cart.update_attribute(:purchased_on, Time.now) if response.success?
    response.success?      
  end
 
  def total_price
    cart.total_price
  end

  def price_in_cents
    (total_price*100).round
  end



  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
end 

       
  #private method only used for gateway 
 
  private
    def purchase_options
      {
        :ip => ip_address,
        :billing_address => {
          :name     => "christine melia",
          :address1 => "123 Main St.",
          :city     => "New York",
          :state    => "NY",
          :country  => "US",
          :zip      => "10001"
        }
      }
    end
  end





#unworking code for paypal to follow 

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
  
  
  
  


  
  
  
  
   
   
  
