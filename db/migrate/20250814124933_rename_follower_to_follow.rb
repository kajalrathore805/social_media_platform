class RenameFollowerToFollow < ActiveRecord::Migration[7.2]
  def change
     rename_column :follows, :follower_id, :user_id

     add_index :follows, [:user_id, :following_id], unique: true

  end
end
