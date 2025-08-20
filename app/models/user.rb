class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :followers, foreign_key: :following_id, class_name: "Follow", dependent: :destroy
  has_many :follower_users, through: :followers, source: :follower

  has_many :followings, foreign_key: :user_id, class_name: "Follow" , dependent: :destroy
  has_many :following_users, through: :followings, source: :following

  
	validates :name,:email,:password,:phone, presence: true
  validates :bio,length: { minimum: 10 }

 	before_validation :normalize_name, on: :create
  after_validation :normalize_email

  validates :password, confirmation: true

 	validate :password_complexity
  validates :email,uniqueness: { case_sensitive: false }

 	validates :email,
      uniqueness: { message: "has already been taken" },
      format: { with: /\A[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}\z/, message: "is not a valid email address" }

  validates :phone,uniqueness: true, format: { with: /\A(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}\z/,
                      message: "is not a valid Indian mobile number" }
  
  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{5,}$/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one digit, and be a minimum of 5 characters."
    end
  end

  private
    def normalize_name
      self.name = name.capitalize
    end

    def normalize_email
      self.email = email.downcase
    end
end
