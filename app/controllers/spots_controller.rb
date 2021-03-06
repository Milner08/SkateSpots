require 'will_paginate/array'
class SpotsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy


  def new
  	@spot = Spot.new
  end

  def show
    @spot = Spot.find(params[:id])
    @reviews = @spot.reviews.sort_by(&:score).reverse.paginate(page: params[:page])
    @review = @spot.reviews.build if signed_in?
    @photo = Photo.new if signed_in?
    @photos = @spot.photos.paginate(page: params[:page])
  end

  def create
   	@spot = Spot.new(params[:spot])
   	@spot.user_id = current_user.id
   	if @spot.save
   		flash[:success] = "Spot Created"
      redirect_to @spot
   	else
      render 'new'
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update_attributes(params[:spot])
      flash[:success] = "Spot updated!"
      redirect_to @spot
    else
      render 'edit'
    end
  end

  def index
    if(params[:search])
      @spots = Spot.search(params[:search])
    else
      @spots = Spot.paginate(page: params[:page])
    end
  end

  def destroy
    Spot.find(params[:id]).destroy
    flash[:success] = "Spot destroyed."
    redirect_to spots_path
  end
end
