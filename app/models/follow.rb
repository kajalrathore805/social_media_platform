class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
  belongs_to :following, class_name: "User", foreign_key: "following_id"
  has_many :notifications, as: :notifiable,dependent: :destroy
  
  # attr_accessor :current_user

  after_create_commit :notify_post_owner

  def notify_post_owner
    NotificationCreator.new(self, self.following, follower).call
  end
end
