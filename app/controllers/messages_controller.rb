class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.save
    
    redirect_to room_path(message_params[:room_id])
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :content)
  end
end
