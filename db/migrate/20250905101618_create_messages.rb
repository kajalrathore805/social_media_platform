class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :sender_id, null: false, foreign_key: {to_table: :users}
      t.references :receiver_id, null: false, foreign_key: {to_table: :users}
      t.string :message_body

      t.timestamps
    end
  end
end
