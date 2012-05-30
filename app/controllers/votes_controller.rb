class VotesController < ApplicationController
  before_filter :signed_in_user

  def create
    @review = Review.find(params[:votable_id])
    if(params[:like] == "true")
      current_user.upvote!(@review)
    else
      current_user.downvote!(@review)
    end
    respond_to do |format|
      format.html { redirect_back_or @review }
      format.js
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @review = Review.find(@vote.votable_id)
    current_user.unvote!(@review)
    respond_to do |format|
      format.html { redirect_back_or @review }
      format.js
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @review = Review.find(@vote.votable_id)
    @vote.like = !@vote.like
    if @vote.save
      respond_to do |format|
        format.html { redirect_back_or @review }
        format.js
      end
    end
  end
end