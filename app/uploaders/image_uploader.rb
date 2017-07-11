class ImageUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "public/uploads/image_path"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def filename
    "image_#{DateTime.now.to_i}.#{file.extension}" if original_filename
  end

end
