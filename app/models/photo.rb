class Photo < ApplicationRecord
  belongs_to :pin
  mount_base64_uploader :name, ImageUploader

  NUM_OF_COL = ENV['num_of_photo_col'].to_i

  def update_pin_total_photos
    Pin.update_total_photos
  end
end
