class RatingsController < ApplicationController
  def create
    @rating = current_user.ratings.build rating_params
    if @rating.save
      flash[:success] = t "static_pages.rating_success"
      redirect_to request.referer
    else
      flash[:danger] = t "static_pages.rating_fail"
    end
  end

  private

  def rating_params
    params.require(:rating).permit Rating::RATING_PARAMS
  end
end
