class OrdersController < ApplicationController

  def create
    if logged_in? != true
      redirect_to new_session_path, alert: "Please sign in."
    else
      unless current_order
        @order = Order.create!(user_id: current_user.id)
        session[:order_id] = @order.id
        redirect_to root_path
      end
    end
  end

  def show
    @order = current_order
    @items_in_order = current_order.items.order(:category)
  end

  def update
    current_order.update(order_params)
    current_order.save

    if current_order.status == "placed"
      session[:order_id] = nil
      redirect_to confirm_path
    else
      @order = current_order
      @items_in_order = current_order.items
      redirect_to order_path(current_order.id)
    end
  end

  def confirm
  end

  def destroy
    current_order.destroy
    session[:order_id] = nil
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :tip_multiplier)
  end

end
