class UpdateCountUser < ActiveRecord::Migration[7.2]
  def up
    User.find_each do |user|
      User.reset_counters(user.id, :posts)
    end
  end
end
