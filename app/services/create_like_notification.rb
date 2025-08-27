class CreateLikeNotification
  def  initialize(user_action, current_user)

  @user_action = user_action
  # debugger
  @current_user = @user_action.user_id
  
  end

	def call

		Notification.create(

		  recepient: @user,
      actor: @current_user,
      action: 'liked on your post',
      notifiable: @user_action
      )
	end

end
