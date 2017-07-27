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
  belongs_to :user, counter_cache: true

  self.per_page = 20
end
