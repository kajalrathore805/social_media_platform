class ChangeColToComment < ActiveRecord::Migration[7.2]
  def change
    change_column :comments, :commenter, :integer
  end
end
