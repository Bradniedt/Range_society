class MapController < ApplicationController
  def show
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
    binding.pry
    # @ev_stations_facade = EvStationFacade.new(latitude, longitude)
  end
end
