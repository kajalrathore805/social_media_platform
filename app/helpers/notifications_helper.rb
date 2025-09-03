module NotificationsHelper
  def perform_action(notification)
    case notification.notifiable
      when Follow
      link_to  notification.action, user_path(notification.actor)
      when Like, Comment 
      link_to  notification.action,  post_path(notification.notifiable.post)
      when Post
      link_to  notification.action,  post_path(notification.notifiable)
      else
        "No action"
    end
  end
end
