
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  has_many :notifications, as: :notifiable,dependent: :destroy

  validates :user_id , uniqueness: {scope: :post_id}

   after_create_commit :notify_post_owner

  def notify_post_owner

    @notification = CreateLikeNotification.new(self, current_user)
    @notification.call
  end

end
