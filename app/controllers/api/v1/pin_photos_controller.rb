module Api::V1
  class PinPhotosController < ApplicationController
    protect_from_forgery with: :null_session, if: ->{request.format.json?}
    skip_before_filter  :verify_authenticity_token

    def index
      photos = PinPhoto.all
      render json: {:pin_photos => photos}
    end

    def create
      photo_pin = PinPhoto.new(photo_params)
      if photo_pin.save
        render json: photo_pin, status: :created
      else
        render json: photo_pin.errors.messages, status: :unprocessable_entity
      end
    end

    private
    def photo_params
      params.require(:pin_photo).permit(:photo, :pin_id)
    end
  end
end
