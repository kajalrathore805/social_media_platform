class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
  belongs_to :following, class_name: "User", foreign_key: "following_id"
  has_many :notifications, as: :notifiable,dependent: :destroy
end
