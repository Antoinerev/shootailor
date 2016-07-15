class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :update, :edit, :destroy]

  def index
    if current_user.photog?
      @bookings = Booking.where(photog_id: current_user.id)
      @bookings_new = @bookings.where(status: ["new", "client_updated"])
      @bookings_pending = @bookings.where(status: "photog_updated")
    else
      @bookings = Booking.where(client_id: current_user.id)
      @bookings_new = @bookings.where(status: ["new", "photog_updated"])
      @bookings_pending = @bookings.where(status: "client_updated")
    end

    @bookings_accepted = @bookings.where(status: "accepted")
    @bookings_archived = @bookings.where(status: "archived")
  end

  def show
    # @booking = Booking.find(params[:id])
    set_client_and_photog
    set_title
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
    set_client_and_photog
    set_title
  end

  def update
    @booking.update(status: booking_params[:status])
    @booking.update(shooting_details: booking_params[:shooting_details])
    # @booking.update(booking_params)
    redirect_to user_bookings_path(current_user)
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to user_bookings_path(current_user) }
      format.js  # <-- will render `app/views/reviews/destroy.js.erb`
    end
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

  def set_title
    if current_user == @photog
      @title = "Request from #{@client.first_name.capitalize} #{@client.last_name.capitalize}"
    else
      @title = "Request to #{@photog.first_name.capitalize} #{@photog.last_name.capitalize}"
    end
  end
end
