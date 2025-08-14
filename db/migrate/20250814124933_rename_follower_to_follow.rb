class RenameFollowerToFollow < ActiveRecord::Migration[7.2]
  def change
     rename_column :follows, :follower_id, :user_id
  end
end
