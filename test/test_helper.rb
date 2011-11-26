ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require  gem 'minitest'


  class ActiveSupport::TestCase
  # ...
  # Add more helper methods to be used by all tests here...
  def login_as(user)
  session[:user_id] = users(user).id
  end
  def logout
  session.delete :user_id
  end
  def setup
  login_as :one if defined? session
  end
  end
  # Add more helper methods to be used by all tests here...
end
