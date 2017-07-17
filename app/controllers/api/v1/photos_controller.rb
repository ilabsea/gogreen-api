module Api::V1
  class PhotosController < ApplicationController

    def index
      pin = Pin.find(params[:pin_id])
      render json: {:photos => pin.approved_photos}
    end

    def create
      photo = Pin.find(params[:pin_id]).photos.build(params[:photo])
      if photo.save
        render json: photo, status: :created
      else
        render json: photo.errors.messages, status: :unprocessable_entity
      end
    end

    private
    def photo_params
      params.require(:photo).permit(:pin_id)
    end
  end
end
