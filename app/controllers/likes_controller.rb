class LikesController < ApplicationController
  before_filter :signed_in_user

  def create
    @spot = Spot.find(params[:spot_id])
    current_user.like!(@spot)
    respond_to do |format|
      format.html { redirect_to @spot }
      format.js
    end
  end

  def destroy
    @spot = Like.find(params[:id]).spot
    current_user.dislike!(@spot)
    respond_to do |format|
      format.html { redirect_to @spot }
      format.js
    end
  end
end