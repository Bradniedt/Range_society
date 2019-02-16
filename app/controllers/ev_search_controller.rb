class EvSearchController < ApplicationController
  before_action :require_user

  def create
    location = params[:ev_search_location].split(", ")
    session[:ev_search] = {latitude: location[0], longitude: location[1]}
    redirect_to ev_map_path
  end
end
