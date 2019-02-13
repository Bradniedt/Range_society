class SearchController < ApplicationController
  before_action :require_user

  def new
  end

  def create
    
  end

  def require_user
    render_404 unless current_user
  end
end
