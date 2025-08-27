class Comment < ApplicationRecord
  belongs_to :post,counter_cache: true
  has_many :notifications, as: :notifiable,dependent: :destroy
  before_validation :normalize_body, on: :create

  def normalize_body
    self.body = body.capitalize
  end

after_create_commit :notify_post_owner

  def notify_post_owner

    @notification = CreateLikeNotification.new(self, @current_user)
    @notification.call
  end

end


