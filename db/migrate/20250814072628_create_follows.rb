class CreateFollows < ActiveRecord::Migration[7.2]
  def change
    create_table :follows do |t|
      t.integer  :follower_id
      t.integer  :following_id
      t.timestamps
    end

   # add_index :follows, :follower_id, unique: true
   # add_index :follows, :following_id, unique: true
  end
end
