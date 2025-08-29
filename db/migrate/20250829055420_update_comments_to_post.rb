class UpdateCommentsToPost < ActiveRecord::Migration[7.2]
  def up
    Post.find_each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
end
