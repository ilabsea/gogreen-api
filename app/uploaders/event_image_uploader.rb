class EventImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "events"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def filename
    "#{model.id}/image_#{DateTime.now.to_i}.#{file.extension}" if original_filename
  end

end
