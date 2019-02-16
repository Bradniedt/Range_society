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
      f.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_restaurants
    response = conn.get("?term=#{@activity}&latitude=#{@latitude}&longitude=#{@longitude}&limit=25")
    results = JSON.parse(response.body)["businesses"]
    results.map do |result|
      Restaurant.new(result)
    end
  end

end
