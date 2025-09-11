class Comment < ApplicationRecord
  belongs_to :post,counter_cache: true
  belongs_to :user
  has_many :notifications, as: :notifiable,dependent: :destroy
  before_validation :normalize_body, on: :create

  # attr_accessor :current_user

  def normalize_body
    self.body = body.capitalize
  end

  after_create_commit :notify_post_owner


  def notify_post_owner
    NotifyUserJob.perform_later(self, self.post.user, user, "commented on your post")
  end
end


