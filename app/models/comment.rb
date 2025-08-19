class Comment < ApplicationRecord
  
  belongs_to :post,counter_cache: true
  before_validation :normalize_body, on: :create

  private
    def normalize_body
      self.body = body.capitalize
    end
end
