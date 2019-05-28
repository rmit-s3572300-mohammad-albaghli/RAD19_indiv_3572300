class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])  
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You've successfully signed up!"
      log_in @user
      redirect_to :controller => 'static_pages', :action => 'home'
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
end
