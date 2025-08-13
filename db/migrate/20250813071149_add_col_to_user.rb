class AddColToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :post_count, :integer, default: 0, null: false
  end
end
