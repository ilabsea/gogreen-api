class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.float   :latitude, null: false
      t.float   :longitude, null: false
      t.string  :icon
      t.integer :user_id
      t.string  :marker_id

      t.timestamps
    end
  end
end
