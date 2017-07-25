# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  pin_id      :integer
#  is_approved :boolean          default(FALSE)
#  name        :string(255)
#

class Photo < ApplicationRecord
  belongs_to :pin
  mount_base64_uploader :name, ImageUploader

  NUM_OF_COL = ENV['num_of_photo_col'].to_i

  def update_pin_total_photos
    Pin.update_total_photos
  end
end
