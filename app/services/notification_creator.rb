class NotificationCreator
  
  def  initialize(notifiable, recepient, actor)
    @notifiable = notifiable
    @recepient = recepient
    @actor = actor
  end

  attr_accessor :notifiable, :recepient, :actor
  
  def call

     return if recepient == actor
    Notification.create(
      recepient: recepient,
      actor: actor,
      action: action_text,
      notifiable: notifiable
    ) 
  end

  private

  def action_text
    case notifiable
    when Like
      'liked your post'
    when Comment
      'commented on your post'
    when Follow
      'started following you'
    when Post
      'created a new post'
    else
      'performed an action'
    end
  end
end
