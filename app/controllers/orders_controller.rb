class OrdersController < ApplicationController

  def create
    redirect_unless_logged_in
    unless current_order
      @order = Order.create(user_id: current_user.id)
      session[:order_id] = @order.id
      redirect_to root_path
    end
  end

  def destroy
  end

end
