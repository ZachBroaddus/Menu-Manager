class OrdersController < ApplicationController

  def create
    # redirect_unless_logged_in
    if logged_in? != true
      redirect_to new_session_path, alert: "Please sign in."
    else
      unless current_order
        @order = Order.create(user_id: current_user.id)
        session[:order_id] = @order.id
        redirect_to root_path
      end
    end
  end

  def destroy
    @order = current_order
    session[:order_id] = nil
    @order.destroy
    redirect_to root_path
  end

end
