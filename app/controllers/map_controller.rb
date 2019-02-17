class MapController < ApplicationController
  def show
    conn = Faraday.new("https://api.yelp.com/v3/businesses/search") do |f|
      f.adapter Faraday.default_adapter
      f.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
    end
    response = conn.get do |req|
      req.params['latitude'] = session[:search]["lat"]
      req.params['longitude'] = session[:search]["lon"]
      req.params['categories'] = session[:search]["activity"].downcase
    end
    museums_json = JSON.parse(response.body, symbolize_names: true)[:businesses]
    @museums = museums_json.reduce([]) do |museums, raw_museum|
      museums.push(Museum.new(raw_museum))
    end
    @lat = session[:search]["lat"]
    @lon = session[:search]["lon"]
  end
end
