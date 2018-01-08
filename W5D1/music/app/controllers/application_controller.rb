class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  # current user 
  def current_user 
    @current_user = @current_user || User.find_by(session_token: session[:session_token])
  end

  # log in 
  def log_in(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  # log out 
  def log_out
    session[:session_token] = nil 
    current_user
  end

  # logged in?
  def logged_in?
    !!current_user  
  end

  # show 404 error page
  def render_not_found
    render 'layouts/not_found'
  end

end
