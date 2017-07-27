# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  pin_id      :integer
#  is_approved :boolean          default(FALSE)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Photo < ApplicationRecord
  belongs_to :pin, counter_cache: :total_photos
  mount_base64_uploader :name, ImageUploader

  NUM_OF_COL = 8

  scope :approved, -> { where(is_approved: true) }
end
