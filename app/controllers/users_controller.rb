class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    # @users = User.all
    @photogs = User.select { |user| user.photog? }

    if params[:location]
      @location_search = params[:location].downcase
      @photogs = @photogs.select { |photog| photog.address.downcase.include?(@location_search) }
    end
  end

  def show

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

end
