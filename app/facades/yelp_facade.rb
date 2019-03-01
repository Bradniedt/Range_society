class YelpFacade
  def initialize(lat, lon, activities=nil)
    @lat = lat
    @lon = lon
    @activities = activities
  end

  def businesses(activities=nil)
    businesses = Cache.get_businesses(@activities)
    unless businesses
      businesses = service.businesses_search(@activities)
      Cache.write(activities: @activities, lat: @lat, lon: @lon, businesses: businesses)
    end
    businesses
  end

  private

  def service
    YelpService.new(@lat, @lon)
  end
end
