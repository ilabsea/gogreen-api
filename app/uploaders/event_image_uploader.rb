class EventImageUploader < CarrierWave::Uploader::Base
  storage :fog
  def store_dir
    "gogreen/event"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def filename
    "image_#{DateTime.now.to_i}.#{file.extension}" if original_filename
  end

end
