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
#

class Event < ApplicationRecord
  mount_base64_uploader :image, EventImageUploader
  belongs_to :user, :counter_cache => true

  self.per_page = 20

end
