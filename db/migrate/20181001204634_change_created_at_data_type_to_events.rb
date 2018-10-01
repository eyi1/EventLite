class ChangeCreatedAtDataTypeToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :created_at, :timestamps
  end
end
