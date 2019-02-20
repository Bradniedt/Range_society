class EvSearchController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def create
    picked_location = JSON.parse(request.body.read, symbolize_names: true)
    build_destination(picked_location)
    latitude, longitude = picked_location[:coordinates].split(" ")
    session[:ev_search] = {latitude: latitude, longitude: longitude}
    session[:picked_location_html] = picked_location[:popup_html]
    redirect_to ev_map_url, status: 302
  end


  private

  def build_destination(location)
    data = location[:popup_html].split("<p>")[1]
    split_data = ActionController::Base.helpers.strip_tags(data)
    final_data = split_data.split("Address: ")
    dest = Destination.find_or_create_by!(name: final_data[0], location: final_data[1])
    current_user.destinations << dest
  end
end
