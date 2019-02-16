class YelpService
  def initialize(activity,latitude, longitude)
    @activity = activity
    @latitude = latitude
    @longitude = longitude
  end

  def self.get_restaurants(activity, latitude_value, longitude_value)
    new(activity, latitude_value, longitude_value).get_restaurants
  end

  def conn
    Faraday.new("https://api.yelp.com/v3/businesses/search") do |f|
      f.headers["Authorization"] = ENV['YELP_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_restaurants
    response = conn.get("?term=#{@activity}&latitude=#{@latitude}&longitude=#{@longitude}")
    results = JSON.parse(response.body, symbolize_names: true)
    results.each do |result|
      Restaurant.new(result)
    end
  end

end
