class PicturesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]

	def new
		@picture = Pictures.new
	end

	def create
   	@picture = Pictures.new(params[:picture])
   	@picture.user_id = current_user.id
   	if @picture.save
   		flash[:success] = "Picture Saved"
      redirect_to @picture
   	else
      render 'new'
    end
  end

	def show
    @picture = Pictures.find(params[:id])
  end

  def index
    @spots = Pictures.paginate(page: params[:page])
  end

  def edit
    @picture = Pictures.find(params[:id])
  end

  def update
    @picture = Pictures.find(params[:id])
    if @picture.update_attributes(params[:picture])
      flash[:success] = "Picture updated!"
      redirect_to @picture
    else
      render 'edit'
    end
  end

  def destroy
    Pictures.find(params[:id]).destroy
    flash[:success] = "Spot destroyed."
    redirect_to spots_path
  end
end
