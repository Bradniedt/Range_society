class YelpService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def conn
    Faraday.new("https://api.yelp.com/v3/businesses/search") do |f|
      f.adapter Faraday.default_adapter
      f.params['latitude'] = @latitude
      f.params['longitude'] = @longitude
      f.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
    end
  end
  
  def businesses_search(category, term=nil, limit = '24', sort_by = 'distance')
    response = conn.get do |req|
      req.params['term'] = term if term
      req.params['categories'] = category
      req.params['sort_by'] = sort_by
      req.params['limit'] = limit
    end
    JSON.parse(response.body, symbolize_names: true)[:businesses]
  end
end
