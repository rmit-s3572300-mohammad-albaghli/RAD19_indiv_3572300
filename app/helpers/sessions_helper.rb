module SessionsHelper
  # Log a user in 
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Find the current logged in user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # See if the user is currently logged in
  def logged_in
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
