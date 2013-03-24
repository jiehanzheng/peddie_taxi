class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    begin
      auth = request.env["omniauth.auth"]

      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to (request.env['omniauth.origin'] || root_path), :notice => "Welcome!  You've successfully signed in via your #{auth["provider"].titleize} account."
    rescue User::NonePeddieLoginError => e
      redirect_to root_path, :alert => "You must login with a valid Peddie student or faculty account."
    rescue => e
      raise e if not Rails.env.production?
      redirect_to root_path, :alert => e.message
    end
  end

  def destroy
    sessions_destroy()
  end
end
