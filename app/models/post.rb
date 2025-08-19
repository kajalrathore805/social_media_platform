class Post < ApplicationRecord
  belongs_to :user,counter_cache: true
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
 
  accepts_nested_attributes_for :comments, :likes
  validates :title, :body, presence: true
  before_validation :normalize_title, on: :create

  def already_liked?(c_user)
    likes.exists?(user_id: c_user.id)
  end
  
  private
    def normalize_title
      self.title = title.capitalize
    end
end
