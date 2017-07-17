class Pin < ApplicationRecord
  has_many :photos

  def update_total_photos
    pin = Pin.find_by_id(params[:id])
    pin.total_photos = pin.total_photos + 1;
    pin.save!
  end

  def approved_photos
    self.photos.where(is_approved: true)
  end

end
