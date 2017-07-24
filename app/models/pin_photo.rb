# == Schema Information
#
# Table name: pin_photos
#
#  id          :integer          not null, primary key
#  pin_id      :integer
#  is_approved :boolean          default(FALSE)
#

class PinPhoto < ApplicationRecord
  belongs_to :pin
  mount_base64_uploader :photo, ImageUploader


  def update_pin_total_photos
    Pin.update_total_photos
  end
end
