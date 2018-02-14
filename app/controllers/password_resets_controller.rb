class PasswordResetsController < ApplicationController
  before_action :find_user_by_pass_reset_token, only: [:edit, :update]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if params[:email] == ""
      flash.now[:error] = ["Please enter your email address."]
      render :new
    else
      user.send_password_reset if user
      flash[:notice] = ["An email has been sent with password reset instructions."]
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:error] = ["Password reset has expired."]
      redirect_to new_password_reset_path
    elsif @user.update_attributes(user_params)
      flash[:notice] = ["Password has been reset!"]
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def find_user_by_pass_reset_token
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :password)
  end

end
