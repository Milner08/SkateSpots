class ReviewsController < ApplicationController
  before_filter :signed_in_user,  only: [:create, :destroy]
  before_filter :correct_user,    only: :destroy

  def index
  end

  def create
  	spot = Spot.find(params[:review][:spot_id])
  	@review = current_user.reviews.build(params[:review])
  	if @review.save
  		flash[:success] = "Review created!"
  		redirect_to spot
  	else
  		flash[:error] = "Review Failed to save! :("
  		redirect_to spot
  	end
  end

  def destroy
    spot = @review.spot
  	@review.destroy
    redirect_back_or spot
  end

  private
  	def correct_user
      @review = Review.find_by_id(params[:id])
      redirect_back_or @review.spot if (@review.user != current_user) && !current_user.admin?
    end
end