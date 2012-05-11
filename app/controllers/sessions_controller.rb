class SessionsController < ApplicationController
  
  #before_filter :authenticate_user!  
  
 # skip_before_filter :authorize
  def new
  end
  
  
  
  
 

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
     session[:user_id] = user.id
      redirect_to store_url
    else
     redirect_to new_session_url, alert: "Invalid user/password combination"
   end
  end
  
  
 

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Logged out"
  end

end



