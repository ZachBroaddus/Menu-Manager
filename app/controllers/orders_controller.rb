class OrdersController < ApplicationController

  def create
    @entrees = Item.where(category: "entree")
    @appetizers = Item.where(category: "appetizer")
    @desserts = Item.where(category: "dessert")
    @beverages = Item.where(category: "beverage")
    @order_item = OrderItem.new

    if logged_in? != true
      respond_to do |format|
        format.html { redirect_to new_session_path, alert: "Please sign in." }
        format.js { render js: "window.location='#{new_session_path.to_s}'" }
      end
    else
      unless current_order?
        @order = Order.create!(user_id: current_user.id)
        session[:order_id] = @order.id
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
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
    @entrees = Item.where(category: "entree")
    @appetizers = Item.where(category: "appetizer")
    @desserts = Item.where(category: "dessert")
    @beverages = Item.where(category: "beverage")
    @order_item = OrderItem.new

    current_order.destroy!
    # this line may or may not be useless
    current_order = nil
    session[:order_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :tip_multiplier)
  end

end
