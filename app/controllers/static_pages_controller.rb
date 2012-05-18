class StaticPagesController < ApplicationController
  def home
  	@spots = Spot.recent
    if signed_in?
  	 @local = Spot.find_all_by_city(current_user.city, :limit => 4)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
