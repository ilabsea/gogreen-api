class DropCreatePinPhoto < ActiveRecord::Migration[5.0]
  def change
    drop_table :create_pin_photos
  end
end
