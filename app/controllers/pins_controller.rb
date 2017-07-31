class PinsController < ApplicationController
  before_filter :authorize

  def index
    @pins = Pin.order('created_at DESC').paginate(page: params[:page])
  end

  def show
    @pin = Pin.find(params[:id])
    @num_of_row = (@pin.photos.count/Photo::NUM_OF_COL) + (@pin.photos.count % Photo::NUM_OF_COL) - 1
  end
end
