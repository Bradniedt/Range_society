class MapController < ApplicationController
  def show
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
  end
end
