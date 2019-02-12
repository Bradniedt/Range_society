class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user.persisted?
      flash[:success] = "You're logged in #{user.first_name}"
      session[:user_id] = user.id
      redirect_to search_path
    else
      flash[:error] = "Something happened, please try again"
      redirect_to root_path
    end
  end
end
