class SearchController < ApplicationController
  before_action :require_user

  def new
  end

  def create
    coordinates = GeocoderFacade.get_lat_lon(cookies["coordinates"] || params["search_location"])
    cookies.delete "coordinates";
    return handle_invalid_location(coordinates) unless coordinates
    session[:search] = {
      range: params[:ev_range],
      activity: get_activities_search(params["activities"]),
      lat: coordinates[:lat],
      lon: coordinates[:lon]
    }

    redirect_to map_path
  end

  private

  def get_activities_search(activities_params)
    activities_params.map { |p| eval(p).values}.flatten
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
