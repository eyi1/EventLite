class AddCommentToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :comment, :string
  end
end
