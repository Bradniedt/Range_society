class SearchController < ApplicationController
  before_action :require_user

  def new
  end

  def create
    coordinates = get_lat_lon(cookies["coordinates"] || params["search_location"])
    cookies.delete "coordinates";
    return handle_invalid_location(coordinates) unless coordinates

    session[:search] = {
      range: params[:ev_range],
      activity: params[:activity],
      lat: coordinates[:lat],
      lon: coordinates[:lon]
    }

    redirect_to map_path
  end

  def require_user
    render_404 unless current_user
  end

  private

  def get_lat_lon(location)
    case location
    when /\d{2}\.\d{7,16} -\d{3}\.\d{7,16}/ then
      lat, lon = location.split(" ")
      return {lat: lat, lon:lon}
    when /^\d{5}\s*$/ then
      # will need to change this eventually if we want this to work nationally.
      result = Geocoder.search(location).select{ |place| place.data["address"]["state"] == "Colorado"}.first.data
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
