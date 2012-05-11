# writen by christine melia reference to excerps from Agile web development with rails 4 th edition 

class ApplicationController < ActionController::Base
  
  rescue_from CanCan::AccessDenied do |exception|
      redirect_to store_url, :alert => exception.message
    end
  
  
 # before_filter :authenticate_user!, :except => [:show, :index]
  # Access Current User
  
  #load_and_authorize_resource
  
  
  #before_filter :authorize
 # protect_from_forgery
  

  

  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    # ...

  protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to new_session_url, :notice => "Please log in"
      end
    end
end
