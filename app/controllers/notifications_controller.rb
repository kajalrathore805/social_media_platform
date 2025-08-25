class NotificationsController < ApplicationController
	
	def index
	    @notifications = Notification.includes(:actor, :notifiable)
  end

  def show
  	@notification = Notification.find(params[:id])
  end

  def delete_notification
  	@user = User.find(params[:recepient_id])
  	@notification = @user.notifications.find(params[:id])
  	@notification&.destroy
  	 redirect_back fallback_location: notifications_path
  end

  # def destroy
  # 	@user = User.find(params[:recepient_id])
  # 	@notification = @user.notifications.find(params[:id])
  # 	@notification&.destroy
  # 	redirect_to notifications_path
  # end
end
