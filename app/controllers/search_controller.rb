class SearchController < ApplicationController
  before_action :require_user

  def new
  end

  def create
    coordinates = get_lat_lon(params["search_location"])
    return handle_invalid_location(coordinates) unless coordinates
    redirect_to map_path
  end

  def require_user
    render_404 unless current_user
  end

  private

  def get_lat_lon(location)
    case location
    when /\d{2}\.\d{7} -\d{3}\.\d{7}/ then
      lat, lon = location.split(" ")
      return {lat: lat, lon:lon}
    when /\d{5}/ then
      result = Geocoder.search(location).first.data
      lat = result["lat"]
      lon = result["lon"]
      return {lat: lat, lon:lon}
    when /^$/ then
      return nil
    else
      return false
    end
  end

  def handle_invalid_location(coordinates)
    if coordinates == nil
      flash[:error] = 'Zip Code must be entered or press \'Use Current Location\''
    elsif coordinates == false
      flash[:error] = 'Invalid Zip Code - try again or press \'Use Current Location\''
    end
    redirect_to new_search_path
  end
end
