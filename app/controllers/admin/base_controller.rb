class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render_404 unless current_user && current_admin
  end
end
