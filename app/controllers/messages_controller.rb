class MessagesController < ApplicationController
  before_action :set_receiver, only: [:new, :create, :index]

  def index
    @messages = Message.where(
      "(sender_id = :current_user AND receiver_id = :receiver) OR (sender_id = :receiver AND receiver_id = :current_user)",
      current_user: current_user.id, receiver: @receiver.id
    ).order(created_at: :asc)
  end

  def new
    @message = Message.new(sender_id: current_user.id, receiver_id: @receiver.id)
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.receiver_id = @receiver.id

    if @message.save
      redirect_to messages_path(receiver_id: @receiver.id), notice: "Message sent."
    else
      render :new, alert: "Failed to send message."
    end
  end

  private

  def set_receiver
    @receiver = User.find(params[:receiver_id])
  end

  def message_params
    params.require(:message).permit(:message_body)
  end
end
