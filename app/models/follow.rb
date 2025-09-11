class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
  belongs_to :following, class_name: "User", foreign_key: "following_id"
  has_many :notifications, as: :notifiable,dependent: :destroy
  
  # attr_accessor :current_user
  validates :following_id , uniqueness: {scope: :user_id}

  after_create_commit :notify_post_owner

  def notify_post_owner
    NotifyUserJob.perform_later(self, self.following, follower, "Started followed")
  end
end
