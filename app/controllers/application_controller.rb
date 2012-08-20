class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  
  def current_user
    if cookies[:user_id]
    @current_user ||= User.find_by_id(cookies.signed[:user_id])
    end
  end
  helper_method :current_user
  
  def signed_in?
    current_user
  end
  helper_method :signed_in?
  
  def authenticate
    if !signed_in?
      redirect_to sign_in_path
    end
  end
  
  def require_login
    if !logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to sign_in_path # halts request cycle
    end
  end
  
  def logged_in?
      !!current_user
  end
  
  
end
