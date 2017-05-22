class PinPhoto < ApplicationRecord
  belongs_to :pin
  mount_base64_uploader :photo, ImageUploader

end
