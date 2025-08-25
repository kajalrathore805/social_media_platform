class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  has_many :notifications, as: :notifiable,dependent: :destroy

  # after_create_commit :notify_post_owner

  validates :user_id , uniqueness: {scope: :post_id}



end
