  class OrdersController < ApplicationController
     
     
     
     
      skip_before_filter :authorize, only: [:new, :create]
     # GET /orders
     # GET /orders.xml
     
     
     def index
       @orders = Order.paginate :page=>params[:page], :order=>'created_at desc',:per_page => 10

       respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @orders }
       end
     end



     # GET /orders/1
     # GET /orders/1.xml
     def show
       @order = Order.find(params[:id])
       respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @order }
       end
     end
     
     
     

     # GET /orders/new
     # GET /orders/new.xml
     def new
       @cart = current_cart
       if @cart.line_items.empty?
         redirect_to store_url, :notice => "Your cart is empty"
         return
       end

       @order = Order.new
       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @order }
       end
     end




     # GET /orders/1/edit
     def edit
       @order = Order.find(params[:id])
     end




    
      # @order = Order.new(params[:order])
     #  @order.add_line_items_from_cart(current_cart)

     #  respond_to do |format|
     #  if @order.save
     #   Cart.destroy(session[:cart_id])
      #session[:cart_id] = nil

     #format.html { redirect_to store_url, notice:
     #  'Thank you for your order.' }




     #  format.json { render json: @order, status: :created,
     #  location: @order }
     #  else
     #  @cart = current_cart
      # format.html { render action: "new" }
      # format.json { render json: @order.errors,
      # status: :unprocessable_entity }
     #      end
     ##    end
     #  end


   
     # POST /orders
     # POST /orders.xml
     def create
       @order = current_cart.build_order(params[:order])
        @order.add_line_items_from_cart(current_cart)
       @order.ip_address = request.remote_ip

        respond_to do |format|
          if @order.save
            Cart.destroy(session[:cart_id])
            session[:cart_id] = nil
            format.html { redirect_to(store_url, :notice => 
              'Thank you for your order.') }
            format.xml  { render :xml => @order, :status => :created,
              :location => @order }
              
              if @order.purchase
                 format.html{render :action => "success"}
                else
                 format.html {  render :action => "failure"}
                end
           else   
                @cart = current_cart
                 format.html { render action: "new" }
                 format.json { render json: @order.errors,
                  status: :unprocessable_entity }
                
 
     end 
  end 
        end 
       
          


     

     
           
           
            
       
     
     
     
     
     
  #     def create
   #      @order = current_cart.build_order(params[:order])
    #     @order.ip_address = request.remote_ip
    #     if @order.save
    #       if @order.purchase
       #      render :action => "success"
          # else
            # render :action => "failure"
          # end
        # else
          # render :action => 'new'
        # end
      # end

     
     
     
     
     
     
     
     
     

     # PUT /orders/1
     # PUT /orders/1.xml
     def update
       @order = Order.find(params[:id])

       respond_to do |format|
         if @order.update_attributes(params[:order])
           format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
         end
       end
     end

     # DELETE /orders/1
     # DELETE /orders/1.xml
     def destroy
       @order = Order.find(params[:id])
       @order.destroy

       respond_to do |format|
         format.html { redirect_to(orders_url) }
         format.xml  { head :ok }
       end
     end
  end 









# code not working with express

 #  def express
  #    response = EXPRESS_GATEWAY.setup_purchase(current_cart.build_order.price_in_cents,
  #      :ip => request.remote_ip,
  #      :return_url => new_order_url,
  #      :cancel_return_url => products_url
   #   )
   #   redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
   # end




 

  # def new
 #  @order = Order.new(:express_token => params[:token])
  # end

  
  #    def purchase
   #   response = process_purchase
  #   end

  #    def process_purchase
   #   EXPRESS_GATEWAY.purchase(amount, express_purchase_options)
  #   end

   #   def express_purchase_options
   #   {
    #  :ip => ip_address,
    #  :token => express_token,
    #  :payer_id => express_payer_id
    #  }
    #  end

# comunicating with paypal to get the purchase and return it back to the redirect url via  a token , this has not been done in the conventional restful style so i have to map it to orders resourse in my routes.r

 #  def express
 #    response = EXPRESS_GATEWAY.setup_purchase(current_cart.build_order.price_in_cents,
   #   
   #    :return_url        => new_order_url,
  #     :cancel_return_url => products_url
 #    )
 #    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
 #  end

 








  # GET /orders/new
  # GET /orders/new.json
  # def new
 #    @cart = current_cart
 # #    if @cart.line_items.empty?
  #     redirect_to store_url, notice: "Your cart is empty"
#       return
    # end
    # @order = Order.new(:express_token => params[:token])

    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @order }
  #   end
   # end

  





 

  # POST /orders
  # POST /orders.json
  
    
     
  
  
  
  
  #   def create
    #      @order = current_cart.build_order(params[:order])
    #     @order.ip_address = request.remote_ip
     #     if @order.save
      #      if @order.purchase
     #          render :action => "success"
      #      else
      #        render :action => "failure"
      #      end
       #   else
       #     render :action => 'new'
       #   end
     #   end
    #  end
  
 
  
  
  
  
    # ordder paramaeter frm my old order system that sent to builder xml for whom bought what changed now to new create method for paypal express
  #  def create
   # @order = Order.new(params[:order])
  #  @order.add_line_items_from_cart(current_cart)
    
  #  respond_to do |format|
  #  if @order.save
  #   Cart.destroy(session[:cart_id])
   #session[:cart_id] = nil
   
  #format.html { redirect_to store_url, notice:
  #  'Thank you for your order.' }
    
    
    
    
  #  format.json { render json: @order, status: :created,
  #  location: @order }
  #  else
  #  @cart = current_cart
   # format.html { render action: "new" }
   # format.json { render json: @order.errors,
   # status: :unprocessable_entity }
  #      end
  ##    end
  #  end
  
  # PUT /orders/1
  # PUT /orders/1.json
 
    