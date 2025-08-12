class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :comments, :likes
  validates :title, :body, presence: true
end
