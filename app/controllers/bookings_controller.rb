class BookingsController < ApplicationController

  # before_action :set_booking, only: []

  def index
    @bookings = Booking.select { |booking| booking.client_id == current_user.id }
  end

  def show
  end

  def new
    @photog = User.find(params[:user_id])
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:photog_id, :client_id, :client_needs, :shooting_location, :shooting_on, :shooting_price, :shooting_details, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
