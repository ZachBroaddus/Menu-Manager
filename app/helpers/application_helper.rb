module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def admin?
    current_user.role == "admin"
  end

  def redirect_unless_logged_in_admin
    if logged_in? != true
      redirect_to new_session_path, alert: "Please sign in."
      return
    elsif admin? != true
      redirect_to root_path, alert: "You are not authorized to do that."
    end
  end

  def current_order
    @current_order ||= Order.find_by(id: session[:order_id])
  end

  def item_not_in_cart?(item)
    !current_order.items.include?(item)
  end

  def current_order_item(item)
    @order_item = current_order.order_items.find_by(item_id: item.id)
  end

  def pretty_price(price)
    sprintf "%.2f", price
  end

  def fixed_footer
    if current_page?('/confirm')
      'fixed'
    elsif current_order
      if current_page?(controller: 'orders', action: 'show', id: current_order.id) && current_order.items.count < 3
        'fixed'
      end
    end
  end

end
