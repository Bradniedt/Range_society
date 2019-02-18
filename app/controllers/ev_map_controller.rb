class EvMapController < ApplicationController
  def show
    # this will ultimately be something like this, have to hard code for now
    # @ev_search_lat = session[:ev_search]["latitude"]
    # @ev_search_lon = session[:ev_search]["longitude"]

    @ev_search_lat = "39.7392"
    @ev_search_lon = "-104.9903"
    @ev_facade = EvStationFacade.new(@ev_search_lat, @ev_search_lon)
    @ev_stations = @ev_facade.public_ev_stations
  end
end
