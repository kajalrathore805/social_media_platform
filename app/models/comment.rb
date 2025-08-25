class Comment < ApplicationRecord
  belongs_to :post,counter_cache: true
  has_many :notifications, as: :notifiable,dependent: :destroy
  before_validation :normalize_body, on: :create

  def normalize_body
    self.body = body.capitalize
  end


end


