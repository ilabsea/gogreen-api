module Api::V1
  class PinsController < ApplicationController
    protect_from_forgery with: :null_session, if: ->{request.format.json?}

    def index
      pins = Pin.all
      render json: {:pins => pins}
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
        render json: {pin: pin, status: 201}
      end
    end

    def get_by_marker_id
      pin = Pin.find_by marker_id: params[:marker_id]
      render json: pin
    end

    def count_by_user
      count = Pin.where(:user_id => params[:user_id]).count
      render json: {:number_of_pins => count}
    end

    private
    def pin_params
      params.require(:pin).permit(:latitude, :longitude, :icon , :user_id, :marker_id)
    end
  end
end
