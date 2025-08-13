class RemoveColumnFromUser < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :post_count, :integer
  end
end
