class OrderItemsController < ApplicationController

  def create
    p "params"
    p params
    @order_item = OrderItem.new(order_item_params)
    @order_item.save
    p "This is the new order item"
    p @order_item
    redirect_to root_path
  end

  def destroy
    order_item = current_order.order_items.find_by(id: params[:id])
    current_order.order_items.where(item_id: order_item.item_id).destroy_all
    redirect_to root_path
  end

  private
  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id)
  end

end
