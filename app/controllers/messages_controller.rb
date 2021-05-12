class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id]) #パラムスをもらい、roomを変更する為
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end

    def destroy
      room = Room.find(params[:room_id])
      room.destroy
      redirect_to root_path
    end

end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # :image を追記することで画像ファイルの保存を許可した
  end
end
