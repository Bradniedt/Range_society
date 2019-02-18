class Dashboard::UsersController < Dashboard::BaseController
  def show
    @user = User.find(session[:user_id])
  end
end
