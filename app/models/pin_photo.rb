class PinPhoto < ApplicationRecord
  belongs_to :pin
  mount_base64_uploader :photo, ImageUploader


  def update_pin_total_photos
    Pin.update_total_photos
  end
end
