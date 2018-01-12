module ApplicationHelper

  # make sure to delete any methods in here that are not being used
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def admin?
    current_user.role == "admin"
  end

  def redirect_unless_logged_in
    redirect_to new_session_path, alert: "Please sign in." unless logged_in?
  end

  # refactor potential here using the method above?
  def redirect_unless_logged_in_admin
    if logged_in? != true
      redirect_to new_session_path, alert: "Please sign in."
      return
    elsif admin? != true
      redirect_to root_path, alert: "You are not authorized to do that."
    end
  end

  def authorized?(user)
    current_user == user
  end

  def current_order
    # if !session[:order_id].nil?
    #   Order.find(session[:order_id])
    # else
    #   Order.new
    # end
    @current_order ||= Order.find_by(id: session[:order_id])
  end

end
