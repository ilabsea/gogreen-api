# == Schema Information
#
# Table name: pins
#
#  id           :integer          not null, primary key
#  latitude     :float(24)
#  longitude    :float(24)
#  icon         :string(255)
#  user_id      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  marker_id    :string(255)
#  total_photos :integer
#

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
