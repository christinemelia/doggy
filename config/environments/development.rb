Doggy::Application.configure do
  
  
  
 
  
  
  # Force ActiveMerchant into test mode
    #  config.after_initialize do
      #  ActiveMerchant::Billing::Base.mode = :test
      #  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
        #    :login => "biz_1329172524_biz_api1.gmail.com",
        #    :password => "1329172549",
         #   :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AHB0rOml2zwZlwZA-JBZgInsZE-9 "
        #  )
  
   # end 
    # ActiveMerchant::Billing::Base.mode = :test
    # EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(
   
     #paypal_options = {
      #  #   :login => "biz_1329172524_biz_api1.gmail.com",
      #   :password => "1329172549",
    #     :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AHB0rOml2zwZlwZA-JBZgInsZE-9"
    #     )
   #    end 
    # }
    # ::STANDARD_GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(paypal_options)
     #::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)

   
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
 

  
   require 'tlsmail'       
   Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)   
   ActionMailer::Base.delivery_method = :smtp   
   ActionMailer::Base.perform_deliveries = true   
   ActionMailer::Base.raise_delivery_errors = true   
   ActionMailer::Base.smtp_settings = {   
   :enable_starttls_auto => true,     
   :address            => 'smtp.gmail.com',   
   :port               => 587,   
   :tls                  => true,   
   :domain             => 'christinemelia@gmail.com',    
   :authentication     => :plain,   
   :user_name          => 'christinemelia@gmail.com',   
   :password           => 'baxter2011' # for security reasons you can use a environment variable too. (ENV['INFO_MAIL_PASS'])   
   }   
   
   config.action_mailer.default_url_options = { :host => '<http://gentle-frost-8013.herokuapp.com>' }   
   
  

  
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  
  config.gem "activemerchant", :lib => "active_merchant"
  
  # paypal active merchant config to test mode environment development 
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test
    ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(

    :login => "christ_1335351587_biz_api1.gmail.com",
    :password => "1335351625",
    :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AGcqIRyzmQoYJ.LYnbgZ.hyBt7ZA "
  )
  
 
 end 

 
 
 
  
end
