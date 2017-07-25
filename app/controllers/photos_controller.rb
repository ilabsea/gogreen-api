class PhotosController < ApplicationController
  before_filter :authorize

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      render json: @photo
    else
      render json: {errors: @photo.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    head :ok
  end

  private
  def photo_params
    params.require(:photo).permit(:pin_id, :is_approved)
  end

end
