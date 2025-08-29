class AddUserRefToComment < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :user, foreign_key: true

    remove_column :comments, :commenter, :integer
  end
end
