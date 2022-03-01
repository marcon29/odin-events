class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username], email: params[:email])

    if @user.try(:authenticate, params[:password])
      log_user_in(@user)
    elsif @user
      @user.errors.add(:password, "You must enter the correct password.")
      render "events/index"
    else
      @user = User.new
      @user.errors.add(:username, "You must enter a correct username.") if params[:username].blank?
      @user.errors.add(:email, "You must enter a correct email.") if params[:email].blank?
      @user.errors.add(:password, "You must enter the correct password.") if params[:password].blank?
      # render "static/home"
      render "events/index"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  
end
