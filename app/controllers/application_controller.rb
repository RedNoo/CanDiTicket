class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_member, :logged_in?, :current_user,:logged_in_user?

  def current_member
    @current_member ||=  Member.find(session[:member_id]) if session[:member_id]
  end

  def logged_in?
    !!current_member
  end

  def require_member
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_user?
    !!current_user
  end

  def require_user
    if !logged_in_user?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
