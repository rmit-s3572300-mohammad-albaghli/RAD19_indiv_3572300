class StaticPagesController < ApplicationController
  def home
    @users = User.all
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def signup
  end
end
