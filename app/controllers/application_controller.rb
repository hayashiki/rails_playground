class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  private
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  # def sign_in(user:)
  #   reset_session
  #   session[:user_id] = user.id
  # end

  def sign_out
    reset_session
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'please login'
  end
end
