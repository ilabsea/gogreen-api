# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  pin_id     :integer
#  status     :string(50)
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  belongs_to :pin, counter_cache: :total_photos
  mount_base64_uploader :name, ImageUploader

  NUM_OF_COL = 8

  scope :approved, -> { where(is_approved: true) }
end
