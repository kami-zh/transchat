class RoomsController < ApplicationController
  layout 'room'

  def show
    @room = Room.find(params[:id])

    @message = Message.new
  end

  def create
    room = Room.create

    redirect_to room
  end
end
