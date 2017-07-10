class Event < ApplicationRecord
  mount_base64_uploader :image, EventImageUploader
end
