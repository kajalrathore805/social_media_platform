class NotifyUserJob < ApplicationJob
  queue_as :default

  def perform(notifiable, recepient, actor, action)
    NotificationCreator.new(notifiable, recepient, actor, action).call
  end

end
