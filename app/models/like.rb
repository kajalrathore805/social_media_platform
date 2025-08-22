class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  has_many :notifications

  validates :user_id , uniqueness: {scope: :post_id}
end
