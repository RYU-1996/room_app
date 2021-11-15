class RoomsController < ApplicationController
  #def index
    #@rooms = Room.all
  #end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = @current_user
      if @room.save
        flash[:notice] = "Room was successfully created."
        redirect_to @room
      else
        render :new
      end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def search
    @results = @q.result
  end
  
  private
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :price, :address, :user_id, :image, :image_cache)
  end
  
  def set_q
    @q = Room.ransack(params[:q])
  end
  
end
