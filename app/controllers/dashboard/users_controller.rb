class Dashboard::UsersController < ApplicationController
  before_action :require_user
  def show
    @user = User.find(session[:user_id])
  end
end
