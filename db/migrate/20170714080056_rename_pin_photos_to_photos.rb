class RenamePinPhotosToPhotos < ActiveRecord::Migration[5.0]
  def change
    rename_table :pin_photos, :photos
  end
end
