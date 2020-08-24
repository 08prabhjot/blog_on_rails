class ApplicationController < ActionController::Base

  private

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find session[:user_id]
    end
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user.present?
      flash[:danger] = "You need to be signed in first!"
      redirect_to new_session_path
    end 
  end

end
