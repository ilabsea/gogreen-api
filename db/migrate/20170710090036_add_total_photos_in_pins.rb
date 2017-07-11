class AddTotalPhotosInPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :total_photos, :integer
  end
end
