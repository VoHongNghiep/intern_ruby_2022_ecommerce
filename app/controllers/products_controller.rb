class ProductsController < ApplicationController
  def index
    @products = Product.newest
    @categories = Category.newest
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def result
    @name = params[:name]
    @pagy, @products = pagy Product.by_name params[:name]
  end
end
