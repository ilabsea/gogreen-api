# == Schema Information
#
# Table name: pins
#
#  id         :integer          not null, primary key
#  latitude   :float(24)        not null
#  longitude  :float(24)        not null
#  icon       :string(255)
#  user_id    :integer
#  marker_id  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pin < ApplicationRecord
  self.table_name = 'pins'

  ICONS = %w(happy sad trash)

  has_many :photos
  belongs_to :user, counter_cache: true

  validates :latitude, :longitude, presence: true
  validates :user_id, :marker_id, presence: true
  validates :icon, presence: true, inclusion: ICONS

  self.per_page = 20
end
