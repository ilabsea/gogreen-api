class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string  :title
      t.text    :description
      t.string  :facebook_link, null: false
      t.string  :location
      t.date    :date
      t.time    :start_time
      t.time    :end_time
      t.string  :image
      t.integer :user_id

      t.timestamps
    end
  end
end
