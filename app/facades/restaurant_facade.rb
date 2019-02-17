class RestaurantFacade
  def initialize(activity, latitude, longitude)
    @activity = activity
    @lat = latitude
    @long = longitude
  end

  def restaurants
    restaurant_service.map do |data|
      Restaurant.new(data)
    end
  end

  def restaurant_service
    YelpService.get_restaurants(@activity, @lat, @long)
  end
end
