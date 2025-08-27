class NotificationsController < ApplicationController
	
	def index
	    @notifications = Notification.includes(:actor, :notifiable)
  end

   def delete_notification
      @notification = Notification.find(params[:id])
      @notification.destroy
      redirect_back fallback_location: notifications_path
   end
end
