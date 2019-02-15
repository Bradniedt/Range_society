class MapController < ApplicationController
  def show
    @lat = session[:search]["lat"]
    @lng = session[:search]["lon"]
  end
end
