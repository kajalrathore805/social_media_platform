module Visible extend ActiveSupport::Concern
  class_methods do
    def comments_count
      where(post_id: 8).count
    end
  end
end