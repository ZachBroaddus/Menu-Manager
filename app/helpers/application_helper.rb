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

  def current_order?
    current_order.id != nil
  end

  def current_order
    if session[:order_id]
      Order.find_by(id: session[:order_id])
    else
      Order.new
    end
  end

  def item_not_in_cart?(item)
    if current_order?
      return !current_order.items.include?(item)
    end
    true
  end

  def current_order_item(item)
    @order_item = current_order.order_items.find_by(item_id: item.id)
  end

  def pretty_price(price)
    sprintf "%.2f", price
  end

  def full_height
    if current_order?
      unless current_page?(order_path(current_order.id)) && current_order.items.count > 1 || current_page?(root_path)
        'full-height'
      end
    elsif !current_page?(root_path)
      'full-height'
    end
  end

  def flash_padding
    if flash.any?
      'less-padding'
    end
  end

  def original_url
    base_url + original_fullpath
  end

end
