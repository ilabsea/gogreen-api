# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :text(65535)
#  facebook_link :string(255)      not null
#  location      :string(255)
#  date          :date
#  start_time    :time
#  end_time      :time
#  image         :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Event < ApplicationRecord
  self.table_name = 'events'

  mount_base64_uploader :image, EventImageUploader
  belongs_to :user, counter_cache: true

  ## Callbacks
  before_save :set_protocol

  validates :title, :facebook_link, :location, presence: true
  validates :date, :start_time, :end_time, :user_id, presence: true

  self.per_page = 20

  private

  def set_protocol
    self.facebook_link = facebook_link.start_with?('http://', 'https://') ? facebook_link : "http://#{facebook_link}"
  end
end
