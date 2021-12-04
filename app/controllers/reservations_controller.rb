class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :confirm]
  
  def index
    @reservations = Reservation.all
  end
  
  def confirm
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room
    if @reservation.invalid?
      render template: 'rooms/show'
    else
      @dates_of_reservation = (@reservation.end_date - @reservation.start_date).to_i
    end
  end
  
  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room
    if params[:back]
      render template: 'rooms/show'
    elsif @reservation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to reservations_complete_path(@reservation.id)
    else
      render room_path(@reservation.room.id)
    end
  end
  
  def complete
    @reservation = Reservation.find(params[:reservation_id])
    @reservation = Reservation.new(reservation_params)
    @dates_of_reservation = (@reservation.end_date - @reservation.start_date).to_i
  end
  
  private
  def reservation_params
    params.permit(:start_date, :end_date, :number_of_people, :room_id, :reservation_id)
  end
  
end
