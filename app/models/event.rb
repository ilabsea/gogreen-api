# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :text(65535)
#  facebook_link :string(255)
#  location      :text(65535)
#  date          :date
#  start_time    :time
#  end_time      :time
#  image         :string(255)
#  user_id       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ApplicationRecord
  mount_base64_uploader :image, EventImageUploader
  belongs_to :user, counter_cache: true

  ## Callbacks
  before_save :set_protocol

  self.per_page = 20

  private

  def set_protocol
    self.facebook_link = facebook_link.start_with?('http://', 'https://') ? facebook_link : "http://#{facebook_link}"
  end
end
