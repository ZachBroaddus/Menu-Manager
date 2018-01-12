class OrderItemsController < ApplicationController

  def create
    # consider refactor using strong params

    # item = Item.find_by(id: params[:item_id])
    OrderItem.create(order_id: current_order.id, item_id: params[:item_id])
    redirect_to root_path
  end

  def destroy
    order_item = current_order.order_items.find_by(id: params[:id])
    current_order.order_items.where(item_id: order_item.item_id).destroy_all
    redirect_to root_path
  end

end
