class Dashboard::UsersController < Dashboard::BaseController
  def show
    @user = User.includes(:destinations).find(session[:user_id])
    @destinations = @user.destinations.order(created_at: :desc).limit(10)
  end
end
