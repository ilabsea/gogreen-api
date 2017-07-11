class RenameStartDateInEvent < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :start_date, :date
  end
end
