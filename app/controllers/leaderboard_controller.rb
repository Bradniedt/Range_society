class LeaderboardController < ApplicationController
  def index
    @users = User.top_carbon_savers
  end
end
