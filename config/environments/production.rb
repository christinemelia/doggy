Doggy::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
     # config.after_initialize do
     #   ActiveMerchant::Billing::Base.mode = :production
     #   ::GATEWAY = ActiveMerchant::Billing::BogusGateway.new
    #  end
  
  
  
  
  
  # code not working !!!! keeping to display and show ammount of work put into payments ad gateways tru paypal api and expres gateways 
    #  ActiveMerchant::Billing::Base.mode = :production
    #     paypal_options = {
    #       :login => "biz_1329172524_biz_api1.gmail.com",
     #      :password => "1329172549",
     #      :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AHB0rOml2zwZlwZA-JBZgInsZE-9"
      #   }
      #   ::STANDARD_GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(paypal_options)
      #   ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
     # end
  config.assets.initialize_on_precompile = false
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false
  
  
  
  
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

    config.action_mailer.default_url_options = { :host => 'http://gentle-frost-8013.herokuapp.com' }   

  

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
  
  config.gem "activemerchant", :lib => "active_merchant"

  
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :production
    ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(

    :login => "christ_1335351587_biz_api1.gmail.com",
    :password => "1335351625",
    :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AGcqIRyzmQoYJ.LYnbgZ.hyBt7ZA "
  )
  
end
  
  
end
