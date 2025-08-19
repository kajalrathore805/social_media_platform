class RemoveFollowsFromUser < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :follows_count, :integer
  end
end
