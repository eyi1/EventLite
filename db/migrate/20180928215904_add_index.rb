class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :attendances, [:user_id, :post_id], unique: true
  end
end
