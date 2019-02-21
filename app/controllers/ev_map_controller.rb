class EvMapController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def show
    @ev_search_lat = session[:ev_search]["latitude"]
    @ev_search_lon = session[:ev_search]["longitude"]
    @ev_facade = EvStationFacade.new(@ev_search_lat, @ev_search_lon)
    @ev_stations = @ev_facade.ev_stations
    @picked_location = {
      latitude: @ev_search_lat,
      longitude: @ev_search_lon,
      popup_html: session[:picked_location_html]
    }
  end
end
