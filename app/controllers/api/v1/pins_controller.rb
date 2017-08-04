module Api::V1
  class PinsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      pins = Pin.all
      render json: pins, status: :ok
    end

    def create
      pin = Pin.new(pin_params)
      if pin.save
        render json: pin, status: :created
      else
        render json: pin.errors.messages, status: :unprocessable_entity
      end
    end

    def update
      pin = Pin.find_by_id(params[:id])
      pin.icon = params[:icon]
      if pin.valid?
        pin.save!
        render json: pin
      end
    end

    def show
      pin = Pin.find_by(marker_id: params[:id])
      render json: pin
    end

    private
    def pin_params
      params.require(:pin).permit(:latitude, :longitude, :icon , :user_id, :marker_id)
    end
  end
end
