class LocationsController < ApplicationController
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(category_params)
    if @location.save
      flash[:success] = "You've successfully created a new location!"
      redirect_to :controller => 'static_pages', :action => 'home'
    else
      render 'new'
    end
  end
  
  private
  def category_params
    params.require(:location).permit(:name)
  end
  
end
