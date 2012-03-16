class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  protected

  def confirm_logged_in
      unless current_user
          flash[:notice] = "Thanks to log in or create an account to get access to the page"
          redirect_to :root
          return false
      else
          return true
      end
  end
end
