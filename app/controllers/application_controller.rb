class NotLoggedIn < ActionController::ActionControllerError; end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from NotLoggedIn, with: :redirect_to_login

  def redirect_to_login
      flash[:error] = "Please log in before submitting a link"
      redirect_to :back
  end

  def user_not_authorized
      flash[:error] = "You do not have permission to access this resource"
      redirect_to :back
  end

  protected
  def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
  end

  def set_current_user(user)
      @current_user = user
      session[:user_id] = @current_user.id
  end
end
