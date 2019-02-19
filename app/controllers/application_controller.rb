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

  private

  def cache
    @cache ||= ActiveSupport::Cache::MemoryStore.new
  end

  def save_search(activities, lat, lon, businesses)
    cache.write('activities', activities)
    cache.write('lat', lat)
    cache.write('lon', lon)
    cache.write('businesses', businesses)
  end

  def changed_search?(activities, lat, lon)
    activity_search = activities == @cache.read('activities')
    lat_search = (cache.read('lat').to_f - lat.to_f).abs > 0.0043
    lon_search = (cache.read('lon').to_f - lon.to_f).abs > 0.0043

    activity_search && lat_search && lon_search
  end

  def first_search?
    !cache.read('activities')
  end
end
