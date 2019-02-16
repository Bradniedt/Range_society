class SessionsController < ApplicationController
  def create
    user = User.find_by(email: request.env['omniauth.auth']["info"]["email"])
    return redirect_to dashboard_path if user

    user = User.from_omniauth(request.env['omniauth.auth']) unless user
    if user.persisted?
      flash[:success] = "You're logged in #{user.first_name}"
      session[:user_id] = user.id
    else
      flash[:error] = "Something happened, please try again"
    end
    redirect_to root_path
  end
end
