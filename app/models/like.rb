
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  has_many :notifications, as: :notifiable,dependent: :destroy

  validates :user_id , uniqueness: {scope: :post_id}

  # attr_accessor :current_user
  after_create_commit :notify_post_owner

  def notify_post_owner
    NotificationCreator.new(self, self.post.user, user).call
  end
end
