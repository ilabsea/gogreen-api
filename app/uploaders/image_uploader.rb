class ImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "pins"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def filename
    "#{model.pin.id}/image_#{DateTime.now.to_i}.#{file.extension}" if original_filename
  end

end
