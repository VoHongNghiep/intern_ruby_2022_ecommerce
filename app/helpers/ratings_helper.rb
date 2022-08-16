module RatingsHelper
  def build_rating
    @review = current_user.ratings.build
  end

  def rating?
    !current_user.ratings.find_by product_id: @product.id
  end
end
