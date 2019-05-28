class CoursesController < ApplicationController
  def index
    @users = User.all
    @courses = Course.all
  end
  
  def locationfilter
    @users = User.all
    @courses = Course.all
    @filter = params[:filter]
  end
  
  def categoryfilter
    @users = User.all
    @courses = Course.all
    @filter = params[:filter]
  end
  
  def new 
    @course = Course.new
  end
  
  def create
    @course = Course.new(category_params)
    @course.like = 0
    @course.dislike = 0
    @course.user_id = current_user.id
    @course.category_ids = params[:category_ids]
    @course.location_ids = params[:location_ids]
    if @course.save
      flash[:success] = "You've successfully created a new category!"
      redirect_to :controller => 'static_pages', :action => 'home'
    else
      render 'new'
    end
  end
  
  private
  def category_params
    params.require(:course).permit(:name, :prerequisite, :description)
  end
  
end
