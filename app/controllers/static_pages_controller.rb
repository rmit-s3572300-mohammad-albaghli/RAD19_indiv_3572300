class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @courses = Course.all
  end

  def help
  end
  
  def about
  end
  
  def signup
  end
  
  def contact_us
    @name = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    ContactMailer.contact_us(@name, @email, @subject).deliver
    flash[:success] = "You've sent an email!"
    redirect_to :controller => 'static_pages', :action => 'home'
  end
  
end
