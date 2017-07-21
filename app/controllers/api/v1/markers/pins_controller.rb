module Api::V1::Markers
  class PinsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      pin = Pin.find_by(marker_id: params[:marker_id])
      render json: pin
    end

  end
end
