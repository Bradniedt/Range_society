class EvMapController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def show
    @ev_facade = Cache.retrieve(:ev_facade)
  end
end
