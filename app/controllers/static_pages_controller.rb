class StaticPagesController < ApplicationController
  def mens
    @cate = Category.first
    @product = @cate.products
  end
end
