class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  def index
    # @users = User.all
    @photogs = User.select { |user| user.photog? }

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
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :avatar, :portfolio, :tags, :bio, :price, :photog)
  end

  def set_user
    @user = User.find(params[:id])
  end

end