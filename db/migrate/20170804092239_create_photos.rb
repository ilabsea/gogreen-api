class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :pin_id
      t.string  :status, limit: 50
      t.string  :name
      t.integer :user_id

      t.timestamps
    end
  end
end
