class ApplicationController < ActionController::Base
  # Helper methods are available in both controllers AND views (ERB files).
  helper_method :current_user, :logged_in?

  # Method to fetch the user object based on the user_id stored in the session.
  # We use the ||= operator to cache the result, so the database query runs
  # only once per request.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Simple boolean method to check if the current user exists (i.e., they are logged in).
  def logged_in?
    !!current_user
  end

  # Optional: A method to redirect users if they try to access pages that require login.
  # Use this as a 'before_action' in any controller you want to protect.
  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end
end
