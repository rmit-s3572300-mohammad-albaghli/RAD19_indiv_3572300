class CoursesController < ApplicationController
  def index
    @users = User.all
    @courses = Course.all
  end
end
