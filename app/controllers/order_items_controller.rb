class OrderItemsController < ApplicationController

  def create
    OrderItem.create!(order_item_params)
    redirect_to root_path
  end

  def update
    order_item = OrderItem.find_by(id: params[:id])
    change_quantity(order_item)
    redirect_to order_path(current_order.id)
  end

  def destroy
    order_item = current_order.order_items.find_by(id: params[:id])
    order_item.destroy
    redirect_to root_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :quantity)
  end

  def change_quantity(order_item)
    if params[:change_type] == 'increment'
      order_item.quantity += 1
      order_item.save
    elsif params[:change_type] == 'decrement'
      if order_item.quantity > 1
        order_item.quantity -= 1
        order_item.save
      else
        order_item.destroy
      end
    end
  end

end
