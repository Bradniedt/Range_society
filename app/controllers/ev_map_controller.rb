class EvMapController < ApplicationController
  def show
    @ev_lat = session[:ev_search]["latitude"]
    @ev_lon = session[:ev_search]["longitude"]
  end
end
