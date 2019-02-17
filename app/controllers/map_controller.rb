class MapController < ApplicationController
  def show
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
    @service = YelpService.new(@lat, @lon)
    @businesses = @service.businesses_search(session[:search]["activity"])
  end
end
