class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.toggle(:status).save
    redirect_to admin_dashboard_path
  end
end
