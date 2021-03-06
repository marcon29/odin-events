class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_user_in(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :username, :email, :password)
  end

  def set_user
    @user = current_user
  end
end
