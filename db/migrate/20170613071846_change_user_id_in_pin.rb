class ChangeUserIdInPin < ActiveRecord::Migration[5.0]
  def change
    change_column :pins, :user_id, :string
  end
end
