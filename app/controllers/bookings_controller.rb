class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :update]

  def index
    if current_user.photog?
      @bookings = Booking.select { |booking| booking.photog_id == current_user.id }
    else
      @bookings = Booking.select { |booking| booking.client_id == current_user.id }
    end
    @bookings_pending = @bookings.select { |booking| booking.status == "new" }
    @bookings_photog_upd = @bookings.select { |booking| booking.status == "photog_updated" }
    @bookings_client_upd = @bookings.select { |booking| booking.status == "client_updated" }
    @bookings_accepted = @bookings.select { |booking| booking.status == "accepted" }
    @bookings_archived = @bookings.select { |booking| booking.status == "canceled" }
  end

  def show
    # @booking = Booking.find(params[:id])
    set_client_and_photog
  end

  def new
    @photog = User.find(params[:user_id])
    @booking = Booking.new()
    @client = current_user
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
    @booking.update(status: booking_params[:status])
    redirect_to user_bookings_path(current_user)
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

  def set_client_and_photog
    @photog = User.find(@booking.photog_id)
    @client = User.find(@booking.client_id)
  end
end
