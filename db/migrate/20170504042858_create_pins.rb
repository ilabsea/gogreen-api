class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.float :latitude
      t.float :longitude
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
