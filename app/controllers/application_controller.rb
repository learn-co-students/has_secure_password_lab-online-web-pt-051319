class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    session[:name]
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    # return head(:forbidden) unless session.include? :user_id
    redirect_to controller: 'sessions', action: 'new' unless logged_in?
  end
end
