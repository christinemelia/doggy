Rails.application.config.middleware.use OmniAuth::Builder do
  
  if Rails.env == 'development' || Rails.env == 'test'
  provider :twitter, 'SMuCQMkwpjjeISXo2l1kA', 'TX3sDCUyvidR4XEbIbX8myC6hc9g62Aujy8dt6tXE'
  provider :google_oauth2, ['GOOGLE_KEY'], ['GOOGLE_SECRET']
  provider :facebook, '371054002912427', 'fa34419be9da833b9dadc3134f26591c'
  

  
  else
    # Production
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '371054002912427', 'fa34419be9da833b9dadc3134f26591c'
    end
  end
end





