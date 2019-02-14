class MapController < ApplicationController
  def show
    @range = session[:search][:range]
    @activity = session[:search][:activity]
    @zipcode = session[:search][:zipcode]
    @lat = session[:search][:lat]
    @lon = session[:search][:lon]
  end
end
