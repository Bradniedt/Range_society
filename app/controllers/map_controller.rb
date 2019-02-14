class MapController < ApplicationController
  def show
    @search_query_url = search_query_url(session[:search])
  end

  private

  def search_query_url(search)
    "q=#{search["activity"]}&center=#{search["lat"]},#{search["lon"]}&zoom=14"
  end
end
