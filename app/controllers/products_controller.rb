class ProductsController < ApplicationController
  def index
    @products = Product.newest
    @categories = Category.newest
  end

  def show
    @product = Product.find_by(id: params[:id])
    return if @product.present?

    flash[:danger] = t "static_pages.product_not_found"
    redirect_to root_path
  end

  def result
    @name = params[:name]
    @pagy, @products = pagy Product.by_name params[:name]
  end
end
