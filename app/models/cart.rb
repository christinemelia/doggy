class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :order

  
  

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end



      



   def total_price
    line_items.to_a.sum { |item| item.total_price }
   end 
  
  
  
#  def paypal_encrypted(return_url,notify_url)
   # values = {
    #  :business => 'biz_1329172524_biz@gmail.com',
   #  # :cmd => '_cart',
      #:upload => 1,
  #    :return => return_url,
   ##   :invoice => id,
    #  :notify_url => notify_url,
     # :cert_id => 'E6PY2WPWJNT4Q'
    #}
    #line_items.each_with_index do |item, index|
     # values.merge!({
        
      #  "amount_#{index+1}" => item.product.price,
        # "amount_#{index+1}" => item.total_price,
       # "item_name_#{index+1}" => item.product.title,
    #    "item_number_#{index+1}" => item.id,
     #   "quantity_#{index+1}" => item.quantity
    
    #  })
   # end
    
   # encrypt_for_paypal(values)
    #end

   # PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
    #APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
   # APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

    #def encrypt_for_paypal(values)  
     #   signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)  
      #  OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")  
    #end
  #end


end

# has many association used to depend line items with cart session 
# a cart has many associated line items. These are linked to the cart because each line item contains a reference to its cart’s id.
# add_product() method in my Cart, one that checks whether my list of items already includes the product im adding; if it does, it
# bumps the quantity, and if it doesn’t, it builds a new LineItem