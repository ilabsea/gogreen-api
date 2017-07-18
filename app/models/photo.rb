class Photo < ApplicationRecord
  belongs_to :pin
  mount_uploader :name, ImageUploader

  def update_pin_total_photos
    Pin.update_total_photos
  end
end
