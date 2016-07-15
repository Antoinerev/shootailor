class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_photog, only: [:show]
  def index
    # @users = User.all
    @photogs = User.select { |user| user.photog? }
    if params[:location]
      @location_search = params[:location].downcase
      @photogs = @photogs.select { |photog| photog.address.downcase.include?(@location_search) }
    end

    @markers = Gmaps4rails.build_markers(@photogs) do |photog, marker|
      marker.lat photog.latitude
      marker.lng photog.longitude
    end

  end

  def show
    @booking = Booking.new()
    @client = current_user
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :avatar, :tags, :bio, :price, :photog, portfolios: [])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_photog
    @photog = User.find(params[:id])
  end

end
