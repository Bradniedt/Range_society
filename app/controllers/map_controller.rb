class MapController < ApplicationController
  def show
    @range = session[:range]
    @activity = session[:activity]
    @zipcode = session[:zipcode]
  end
end
