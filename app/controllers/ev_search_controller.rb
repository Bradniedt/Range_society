class EvSearchController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def create
    picked_location = JSON.parse(request.body.read, symbolize_names: true)
    latitude, longitude = picked_location[:coordinates].split(" ")
    session[:ev_search] = {latitude: latitude, longitude: longitude}
    session[:picked_location_html] = picked_location[:popup_html]
    redirect_to ev_map_url, status: 302
  end
end
