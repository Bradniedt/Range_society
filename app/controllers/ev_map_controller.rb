class EvMapController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def show
    @ev_search_lat = session[:ev_search]["latitude"]
    @ev_search_lon = session[:ev_search]["longitude"]
    @ev_facade = EvStationFacade.new(@ev_search_lat, @ev_search_lon)

    @picked_location = {
      latitude: @ev_search_lat,
      longitude: @ev_search_lon,
      popup_html: session[:picked_location_html]
    }

    if first_or_changed_search?(@ev_search_lat, @ev_search_lon)
      @ev_stations = make_api_call(@ev_facade, :public_ev_stations)
      Cache.save_to_cache({
        ev_stations: @ev_stations,
        ev_lat: @ev_search_lat,
        ev_lon: @ev_search_lon },
        CACHE_EXPIRATION )
    else
      @ev_stations = Cache.retrieve('ev_stations')
    end
  end

  private

  def first_or_changed_search?(lat, lon)
    Cache.first_search?('ev_stations') || Cache.changed_station_search?(lat, lon)
  end
end
