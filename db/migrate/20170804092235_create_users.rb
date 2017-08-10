class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :password_digest
      t.boolean :is_super_user, default: false
      t.string  :facebook_id
      t.integer :pins_count, default: 0
      t.integer :events_count, default: 0

      t.timestamps
    end
  end
end
