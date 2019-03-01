class EvMapController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def show
    cached_facade = Cache.retrieve(:ev_facade, delete: true)
    @ev_facade = cached_facade || EvStationFacade.new(
      session[:ev_search]["latitude"],
      session[:ev_search]["longitude"],
      session[:picked_location_html]
    )
  end
end
