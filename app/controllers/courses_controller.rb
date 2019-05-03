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
end
