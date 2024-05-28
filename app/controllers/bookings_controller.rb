class BookingsController < ApplicationController
  before_action :set_character, only: %i[create]
  before_action :set_booking, except: %i[new create index]
  before_action :set_user, only: %i[create]

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.character = @character
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
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
    redirect_to bookings_path
  end


  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
