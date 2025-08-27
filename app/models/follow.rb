class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
  belongs_to :following, class_name: "User", foreign_key: "following_id"
  has_many :notifications, as: :notifiable,dependent: :destroy


  after_create_commit :notify_post_owner

  def notify_post_owner

    @notification = CreateLikeNotification.new(self, user_id)
    @notification.call
  end
end
