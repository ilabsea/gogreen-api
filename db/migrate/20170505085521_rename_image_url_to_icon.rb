class RenameImageUrlToIcon < ActiveRecord::Migration[5.0]
  def change
    rename_column :pins, :image_url, :icon
  end
end
