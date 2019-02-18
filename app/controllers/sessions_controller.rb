class SessionsController < ApplicationController
  def create
    found_user = User.find_by(email: request.env['omniauth.auth']["info"]["email"])
    if found_user
      flash[:notice] = "You're logged in #{found_user.first_name}"
      session[:user_id] = found_user.id
      redirect_to dashboard_path
    else
      create_user
    end
  end

  private

  def create_user
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      flash[:success] = "You're logged in #{user.first_name}"
      session[:user_id] = user.id
    else
      flash[:error] = "Something happened, please try again"
    end
    redirect_to root_path
  end
end
