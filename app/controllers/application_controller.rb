class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def require_user
    render_404 unless current_user
  end

  def render_404
    render file: "./public/404.html", status: 404
  end
end
