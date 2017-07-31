class EventImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "events/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def filename
    "image_#{DateTime.now.to_i}.#{file.extension}" if original_filename
  end

end
