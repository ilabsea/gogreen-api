class AddIsApprovedToPinPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :pin_photos, :is_approved, :boolean, :default => false
  end
end
