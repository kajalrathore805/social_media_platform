class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id , uniqueness: { message: "has already liked" }
end
