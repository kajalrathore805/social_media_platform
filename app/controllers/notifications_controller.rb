class NotificationsController < ApplicationController
skip_before_action :verify_authenticity_token, only: :delete_notification
	def index
    @notifications = current_user.notifications.includes(:actor, :notifiable) 
  end

  def delete_notification
    @notification = Notification.find(params[:id])
    @notification.destroy
    render json: { success: true }, status: 200
  end
end
