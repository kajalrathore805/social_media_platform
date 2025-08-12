class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :posts
  has_many :likes, dependent: :destroy
  
	validates :name,:email,:password,:phone,:bio, presence: true
	
 	before_validation :normalize_name, on: :create

  # validates :password, confirmation: true

 	validate :password_complexity

 	validates :email,
      uniqueness: { message: "has already been taken" },
      format: { with: /\A[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}\z/, message: "is not a valid email address" }

  validates :phone, format: { with: /\A(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}\z/,
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
end
