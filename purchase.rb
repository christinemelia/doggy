require "rubygems"




require "active_merchant"

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "christ_1335351587_biz_api1.gmail.com",
  :password => "1335351625",
  :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AGcqIRyzmQoYJ.LYnbgZ.hyBt7ZA "
)



 #  ActiveMerchant::Billing::Base.mode = :test
  #  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    #    :login => "biz_1329172524_biz_api1.gmail.com",
    #    :password => "1329172549",
     #   :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AHB0rOml2zwZlwZA-JBZgInsZE-9 "
    #  )

# end








credit_card = ActiveMerchant::Billing::CreditCard.new(
  :type               => "visa",
  :number             => "4971919764051056 ",
  :verification_value => "123",
  :month              => 1,
  :year               => Time.now.year+1,
  :first_name         => "christine",
  :last_name          => "Melia"
   
)

if credit_card.valid?
  # or gateway.purchase to do both authorize and capture
  response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1", :billing_address => {
      :name => 'Test User',
      :company => '',
      :address1 => '123 S Main St',
      :address2 => '',
      :city => 'Akron',
      :state => 'OH',
      :country => 'US',
      :zip => '44333',
      :phone => '(310)555-5555'
    })
  if response.success?
    gateway.capture(1000, response.authorization)
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end