class UpdateFollowsCountToUser < ActiveRecord::Migration[7.2]
  def up
    User.find_each do |user|
      User.reset_counters(user.id, :follow_users)
    end
  end
end
