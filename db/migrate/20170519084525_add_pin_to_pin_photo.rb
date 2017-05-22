class AddPinToPinPhoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :pin_photos, :pin, foreign_key: true
  end
end
