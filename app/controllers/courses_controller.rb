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
    @course = Course.new(course_params)
    @course.like = "0"
    @course.dislike = "0"
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
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    @course.category_ids = params[:category_ids]
    @course.location_ids = params[:location_ids]
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated!"
      redirect_to :controller => 'static_pages', :action => 'home'
    else
      render 'edit'
    end
  end
  
  def like
    @course = Course.find(params[:course_id])
    vote_boolean = true
    all_likes = @course.like.split(',')
    all_dislikes = @course.dislike.split(',')
    if(logged_in)
      all_likes.each do |id|
        if (id == current_user.id.to_s)
          vote_boolean = false
        end
      end
      
      all_dislikes.each do |id|
        if (id == current_user.id.to_s)
          vote_boolean = false
        end
      end
      
      if (vote_boolean == true)
        if(params[:to_do] == "like")
          like_string = @course.like + "," + current_user.id.to_s
          @course.like = like_string
        else 
          dislike_string = @course.dislike + "," + current_user.id.to_s
          @course.dislike = dislike_string
        end
        @course.save
      else 
        flash[:danger] = "You can only vote a course once!"
      end
    else
      flash[:danger] = "You're not even logged in! :( STOP TRYING TO BREAK THE WEBSITE."
    end
    redirect_to :controller => 'static_pages', :action => 'home'
  end
  
  private
  def course_params
    params.require(:course).permit(:name, :prerequisite, :description, :picture)
  end
  
end
