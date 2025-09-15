class MessagesController < ApplicationController
  before_action :set_user, only: [:new, :create]


  def new
    @messages = Message.where(
      "(sender_id = :current_user AND receiver_id = :receiver) OR (sender_id = :receiver AND receiver_id = :current_user)",
      current_user: current_user.id, receiver: @user.id
    ).order(created_at: :asc)
    @message = Message.new
  end

  def create
    
    @message = @user.messages.new(message_params)

    if @message.save
      redirect_to new_message_path(receiver_id: @user.id)
    else
      flash[:alert] = "Message not create"
    end
  end

  def set_user
    @user = User.find(params[:receiver_id])
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :message_body)
  end
end
