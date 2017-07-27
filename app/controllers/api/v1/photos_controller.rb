module Api::V1
  class PhotosController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      pin = Pin.find(params[:pin_id])
      # render json: pin.photos.approved
      render json: pin.photos
    end

    def create
      photo = Pin.find(params[:pin_id]).photos.build(photo_params)
      if photo.save
        render json: photo, status: :created
      else
        render json: photo.errors.messages, status: :unprocessable_entity
      end
    end

    private
    def photo_params
      params.require(:photo).permit(:pin_id, :name)
    end
  end
end
