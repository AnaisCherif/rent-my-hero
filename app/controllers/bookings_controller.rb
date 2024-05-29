class BookingsController < ApplicationController
  before_action :set_character, only: %i[create new]
  before_action :set_booking, except: %i[new create index]

  def index
    @bookings = Booking.where(user: current_user)
    @my_bookings = Booking.where(character_id: current_user.characters)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.character = @character
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(params_booking) if @booking.character.user == current_user
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  def accept
    @booking.update(status: true)
    redirect_to dashboard_path
  end

  def decline
    @booking.update(status: false)
    redirect_to dashboard_path
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
