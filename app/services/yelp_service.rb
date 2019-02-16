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
    Faraday.new("https://api.yelp.com/") do |f|
      f.headers["Authorization"] = ENV['YELP_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_restaurants
    response = conn.get("v3/businesses/search?term=#{@activity}&latitude=#{@latitude}&longitude=#{@longitude}&limit=25")
    results = JSON.parse(response.body)["businesses"]
  end

end
