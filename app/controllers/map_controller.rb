class MapController < ApplicationController
  def show
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
    @service = YelpService.new(@lat, @lon)
    activities = session[:search]["activity"]
    @businesses = @service.businesses_search(activities)
  end
end
