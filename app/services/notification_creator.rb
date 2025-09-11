class NotificationCreator
  
  def  initialize(notifiable, recepient, actor, action)
    @notifiable = notifiable
    @recepient = recepient
    @actor = actor
    @action = action
  end

  attr_accessor :notifiable, :recepient, :actor, :action
  
  def call

     return if recepient == actor
    Notification.create(
      recepient: recepient,
      actor: actor,
      action: action,
      notifiable: notifiable
    ) 
  end

  # private

  # def action_text
  #   case notifiable
  #   when Like
  #     'liked your post'
  #   when Comment
  #     'commented on your post'
  #   when Follow
  #     'started following you'
  #   when Post
  #     'created a new post'
  #   else
  #     'performed an action'
  #   end
  # end
end
