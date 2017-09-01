class ChangeReasonColumnTypeOfPhotos < ActiveRecord::Migration[5.0]
  def change
    change_column :photos, :reason, :text
  end
end
