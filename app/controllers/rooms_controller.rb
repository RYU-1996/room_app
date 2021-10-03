class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = @current_user
      if @room.save
        flash[:notice] = "Room was successfully created."
        redirect_to :rooms
      else
        render :new
      end
  end
  
  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: session[:user_id])
  end
  
  def list
    @room = Room.find(params[:id])
  end
  
  private
  def
    params.require(:room).permit(:room_name, :room_introduction, :price, :adress, :room_image)
  end
end
