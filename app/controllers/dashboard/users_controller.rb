class Dashboard::UsersController < Dashboard::BaseController
  decorates_assigned :user
  def show
    @user = User.includes(:destinations).find(session[:user_id])
  end
end
