class AddCounterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pins_count, :integer
    add_column :users, :events_count, :integer
  end
end
