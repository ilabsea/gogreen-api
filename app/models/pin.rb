class Pin < ApplicationRecord
  def update_total_photos
    pin = Pin.find_by_id(params[:id])
    pin.total_photos = pin.total_photos + 1;
    pin.save!
  end
end
