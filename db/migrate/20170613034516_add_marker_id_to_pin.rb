class AddMarkerIdToPin < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :marker_id, :string
  end
end
