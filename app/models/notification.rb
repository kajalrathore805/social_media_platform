class Notification < ApplicationRecord
  belongs_to :recepient, class_name: "User", foreign_key: "recepient_id"
  belongs_to :actor, class_name: "User", foreign_key: "actor_id"
  belongs_to :notifiable, polymorphic: true

end
