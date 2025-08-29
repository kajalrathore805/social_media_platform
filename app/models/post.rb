class Post < ApplicationRecord
  belongs_to :user,counter_cache: true
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :notifications, as: :notifiable,dependent: :destroy
  accepts_nested_attributes_for :comments, :likes
  validates :title, :body, presence: true
  before_validation :normalize_title, on: :create
  validates :body,length: { minimum: 10 }
  after_create_commit :notify_post_owner

  def already_liked?(c_user)
    likes.exists?(user_id: c_user.id)
  end
  
  def notify_post_owner
    self.user.follower_users.each do |follower|
      NotificationCreator.new(self, follower, self.user).call
    end
  end
  private
    def normalize_title
      self.title = title.capitalize
    end
end
