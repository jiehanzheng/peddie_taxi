class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sessions_destroy(notice=nil)
    session[:user_id] = nil

    notice ||= "Successfully signed out.  Goodbye!"
    redirect_to root_path, :notice => notice
  end


  def current_user
    begin
      return @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue => e
      sessions_destroy e.message
    end

    false
  end
  helper_method :current_user


  def signed_in?
    current_user
  end
  helper_method :signed_in?
end
