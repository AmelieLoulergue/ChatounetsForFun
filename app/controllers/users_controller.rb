class UsersController < ApplicationController
  
  before_action :set_user

  def create
  end

  def new
    @user = User.new
  end

  def show
    @users = User.all
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private 

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email)
  end


end
