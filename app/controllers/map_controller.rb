class MapController < ApplicationController
  def show
    @facade = YelpFacade.new(
      session[:search]["lat"],
      session[:search]["lon"],
      session[:search]["activity"]
    )
  end
end
