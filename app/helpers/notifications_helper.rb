module NotificationsHelper
  def perform_action(notification)
    case notification.action
      when "started following you"
      link_to  notification.action, user_path(notification.actor)
      when "liked your post", "commented on your post" 
      link_to  notification.action,  post_path(notification.notifiable.post)
      when "created a new post"
      link_to  notification.action,  post_path(notification.notifiable)
      else
        "No action"
    end
  end
end
