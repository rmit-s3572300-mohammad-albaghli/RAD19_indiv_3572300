class SessionsController < ApplicationController

  def new
  end

  # Logging a user in and redirect to home
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "You've successfully logged in!"
      redirect_to :controller => 'static_pages', :action => 'home'
    else
      flash.now[:danger] = 'Invalid email/password combination!'
      render 'new'
    end
  end

  # Log out and then redirect to home
  def destroy
    log_out
    redirect_to root_url
  end
  
end