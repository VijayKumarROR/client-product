class ProductsController < ApplicationController
before_filter :authenticate_user!
require 'will_paginate/array'

  def new
  	@product = Product.new
  end

  def index
  	#@products = Product.all
  	#@products = Product.all.paginate("created_at ASC" ,:page => params[:page], :per_page => 2)
  	#@products = Product.order(:name).page(params[:page]).per(2)
    @products = Product.order("created_at desc").page(params[:page]).per_page(2)


  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @products }
    format.js
  end
  end

  def create
		@product = Product.new(product_params)
       if @product.save
       	flash[:notice] = "product Saved Successfully"
       	redirect_to :controller => "products", :action => "index"
       else
       	flash[:notice] = "Error"
       	render "new"
       end
	end

  def edit
  	@product = Product.find(params[:id])
  end

  def show
  	@product = Product.find(params[:id])
  end

  private
	def product_params
		params.require(:product).permit(:user_id,:category_id,:name,:cost)
	end
end
