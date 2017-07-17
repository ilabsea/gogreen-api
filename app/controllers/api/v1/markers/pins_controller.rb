module Api::V1::Markers
  class PinsController < ApplicationController

    def index
      pin = Pin.find_by(marker_id: params[:marker_id])
      render json: pin
    end

  end
end
