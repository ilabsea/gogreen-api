class PinsController < ApplicationController
  before_filter :authorize

  def index
    @pins = Pin.paginate(page: params[:page], per_page: Pin::PER_PAGE)
  end

  def show
    @pin = Pin.find(params[:id])
    @num_of_row = (@pin.photos.count/Photo::NUM_OF_COL) + (@pin.photos.count % Photo::NUM_OF_COL) - 1
  end
end
