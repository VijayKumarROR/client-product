class CategoriesController < ApplicationController
before_filter :authenticate_user!  
  def new
        @category = Category.new
  end

  def index
        @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
       if @category.save
        flash[:notice] = "Category Saved Successfully"
        redirect_to :controller => "products", :action => "new"
       else
        flash[:notice] = "Error"
        render "new"
       end
  end

  def edit
        @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attribute(category_params)
      flash[:notice] = "Category Updated Successfully"
      redirect_to :controller => "categories", :action => "index"
    else
      render "edit"
    end
  end


private
  def category_params
    params.require(:category).permit(:name,:about)
  end
end
