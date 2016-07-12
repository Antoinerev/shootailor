class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @photog = User.find(params[:user_id])
    @booking = Booking.new()
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :address, :avatar, :portfolio, :tags, :bio, :price, :photog)
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
