class PhotosController < ApplicationController
	before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]

	def create
   	@photo = Photo.new(params[:photo])
   	@photo.user_id = current_user.id
   	@photo.spot_id = params[:spot_id]
    spot = Spot.find(@photo.spot_id)
   	if @photo.save
   		flash[:success] = "Picture Saved"
      redirect_to spot
   	else
      redirect_to spot
    end
  end

	def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    spot = Spot.find(@photo.spot_id)
    if @photo.update_attributes(params[:picture])
      flash[:success] = "Picture updated!"
      redirect_to spot
    else
      render 'edit'
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    spot = Spot.find(photo.spot_id)
    photo.destroy
    flash[:success] = "Photo Deleted."
    redirect_to spot
  end
end
