class EvMapController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def show
    @ev_facade = EvStationFacade.new(
      session[:ev_search]["latitude"],
      session[:ev_search]["longitude"],
      session[:picked_location_html]
    )
  end
end
