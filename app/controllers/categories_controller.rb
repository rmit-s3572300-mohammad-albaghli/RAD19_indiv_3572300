class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You've successfully created a new category!"
      redirect_to :controller => 'static_pages', :action => 'home'
    else
      render 'new'
    end
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end
