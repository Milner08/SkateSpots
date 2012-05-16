class StaticPagesController < ApplicationController
  def home
  	@spots = Spot.recent
  end

  def help
  end

  def about
  end

  def contact
  end
end
