class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      load_order_in_progress(@user)
      redirect_to root_path
    else
      flash.now[:error] = ["Your password/email combination are incorrect."]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    redirect_to root_path
  end

  private

  def load_order_in_progress(user)
    active_order = user.orders.find_by(status: 'in progress')
    if active_order
      session[:order_id] = active_order.id
    end
  end

end
