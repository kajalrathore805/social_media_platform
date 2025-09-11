class AddIndexToFollows < ActiveRecord::Migration[7.2]
  def change
    add_index :follows, [:user_id, :following_id], unique: true
  end
end
