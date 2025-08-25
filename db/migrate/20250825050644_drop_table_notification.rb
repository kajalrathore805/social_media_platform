class DropTableNotification < ActiveRecord::Migration[7.2]
  def change
    drop_table :notifications
    
  end
end
