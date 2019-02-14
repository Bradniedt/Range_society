class SearchController < ApplicationController
  def new

  end

  def create
    session[:range] = params[:ev_range]
    session[:activity] = params[:activity]
    session[:zipcode] = params[:zipcode]

    redirect_to map_path
  end
end
